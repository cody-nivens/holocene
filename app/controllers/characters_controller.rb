class CharactersController < ApplicationController
  before_action :set_character, only: %i[lineage edit update]
  before_action :set_object, only: %i[scenes matrix lineage index add list edit show create update destroy]

  # GET /characters
  # GET /characters.json
  def index
    session[:return_to] = request.fullpath

    do_index

    respond_to do |format|
      format.js {}
#      format.html {}
      format.turbo_stream { }
    end
  end

  def list_chars
    char_book = Book.find(params[:char_book_id])
    @characters = char_book.characters.order(:last_name, :first_name)

    respond_to do |format|
      format.js {}
    end
  end

  def attributes
    @attributes = CharacterAttribute.where(character_category_id: params[:category_id])

    respond_to do |format|
      format.js {}
    end
  end

  def attribute_values
    @values = CharacterValue.where(character_attribute_id: params[:attribute_id]).pluck(:value).sort.uniq

    respond_to do |format|
      format.js {}
    end
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.includes([{ scenes: :rich_text_summary },{ character_values: :character_attribute }]).find(params[:id])
    @long = params[:long]

    respond_to do |format|
#      format.html {}
      format.turbo_stream { render 'show', locals: { character: @character, object: @object, long: @long }}
    end
  end

  def lineage; end

  # GET /characters/1/list
  def list

    respond_to do |format|
      format.turbo_stream {}
    end
  end

  # GET /characters/1/matrix
  def matrix
    chars_list

    session[:return_to] = request.fullpath

    respond_to do |format|
      format.turbo_stream {}
    end
  end

  # GET /characters/1/scenes
  def scenes
    chars_list

    session[:return_to] = request.fullpath

    respond_to do |format|
      format.turbo_stream {}
    end
  end

  # GET /characters/1/add
  def add
    characters_avail = params[:characters_avail]
    characters_ids = params[:characters_ids]

    unless characters_avail.nil?
      characters_avail.each do |character_id|
        next if character_id.blank?

        character = Character.find(character_id)
        update_character_lists(@object, character)
      end
    end

    unless characters_ids.nil?
      characters_ids.each do |character_id|
        next if character_id.blank?

        character = Character.find(character_id)
        @object.characters.destroy(character) if @object.characters.include?(character)
      end
    end

    respond_to do |format|
      format.html { redirect_to polymorphic_path([@object, :characters_list]) }
#      format.turbo_stream { }
    end
  end

  # POST /characters
  # GET /characters/1/edit
  def edit
    @character = Character.includes([{ character_values: :character_attribute }]).find(params[:id])
  end

  def update_values
    CharacterCategory.all.includes([:character_attributes]).each do |category|
      character_values = @character.character_values.joins(:character_attribute).order(:name).where(
        'character_category_id = ?', category.id
      )
      character_attributes = category.character_attributes
      character_attributes.each do |character_attribute|
        character_value = character_values.where(character_attribute_id: character_attribute.id)[0]
        field_name = "#{category.name.underscore}_#{character_attribute.name.underscore}_value".to_sym

        if attribute_params[field_name].present?
          if attribute_params[field_name] == '---'
            update_value = CharacterValue.where({ character_attribute_id: character_attribute.id,
                                                  character_id: @character.id }).first_or_create
            update_value.destroy
          else
            update_value = CharacterValue.where({ character_attribute_id: character_attribute.id,
                                                  character_id: @character.id }).first_or_create
            update_value.value = attribute_params[field_name]
            update_value.save
          end
        end
      end
    end
  end

  # POST /characters
  # POST /characters.json
  def xcreate
    @character = Character.new
    @character.sex = rand(2)
    @character.user = current_user

    @character.save(validate: false)

    update_character_lists(@object, @character)
    #redirect_to polymorphic_path([@object, @character, :step], id: Character.form_steps.first)
    respond_to do |format|
      format.turbo_stream { render "character/show", locals: { step: Character.form_steps.first } }
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    update_values
    respond_to do |format|
      if @character.update(character_params)
#        format.html { redirect_to polymorphic_path([@object, @character]) }
        format.json { render :show, status: :ok, location: @character }
        format.turbo_stream { flash.now[:notice] = "Character was successfully updated." }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character = Character.includes([{ artifacts: :taggings}]).find(params[:id])
    @character.destroy
    do_index
    respond_to do |format|
      flash.now[:notice] = "Character was successfully destroyed."
#      format.html { redirect_to polymorphic_url([@object, :characters]), notice: 'Character was successfully destroyed.' }
      format.turbo_stream { }
      format.json { head :no_content }
    end
  end

  private

  def do_index
    @category = grid_params[:category]
    @attribute = grid_params[:attribute]
    @value = grid_params[:value]

    my_params = grid_params.except(:category, :attribute, :value)

    if grid_params[:no_ethnicity].to_i == 1
      my_params[:ethnicity] = ['']
    end

    if grid_params[:no_grouping].to_i == 1
      my_params[:grouping] = ['']
    end

    if grid_params[:no_occupation_class].to_i == 1
      my_params[:occupation_class] = ['']
    end

    @grid = CharactersGrid.new(my_params.merge(object: @object)) do |scope|
      if @attribute.present?
        if @value.blank?
          my_scope = scope.joins(:character_values).where('character_values.character_attribute_id = ?',
                                                          @attribute.to_i)
        else
          my_scope = scope.joins(:character_values).where(
            'character_values.character_attribute_id = ? and character_values.value = ?', @attribute.to_i, @value
          )
        end
      else
        my_scope = scope
      end
      my_scope = my_scope.where(user_id: current_user.id)
      my_scope = case @object.class.name
                 when 'Book'
                   my_scope.joins(:books_characters).where('books_characters.book_id = ?', @object.id)
                 when 'Story'
                   my_scope.joins(:character_stories).where('character_stories.story_id = ?', @object.id)
                 else
                   # when "Scene"
                   my_scope.joins(:character_scenes).where('character_scenes.scene_id = ?', @object.id)
                 end
    end

    @pagy, @records = pagy(@grid.assets)
  end

  def chars_list
    @scenes = Scene.get_scenes_to_array(@object)
    characters = @object.characters.joins(:scenes).where("scenes.book_id = ?", @object.id).where("scenes.id",@scenes).group("characters.id")
    chars = []
    characters.each do |character|
      scenes = character.published_scenes(@object)
      chars << [character.id, scenes.length] if scenes.length > 0
    end
    chars = chars.sort {|a1,a2| a2[1]<=>a1[1]}
    @chars = chars
  end

  def update_character_lists(object, character)
    object.characters << character unless object.characters.include?(character)
    case object.class.name
    when 'Story'
      object.book.characters << character unless object.book.characters.include?(character)
    when 'Scene'
      unless object.key_point.scripted.book.characters.include?(character)
        object.key_point.scripted.book.characters << character unless object.key_point.scripted.book.characters.include?(character)
      end
      object.key_point.scripted.characters << character unless object.key_point.scripted.characters.include?(character)
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  def set_object
    klass = [Scene, Story, Book].detect { |c| params["#{c.name.underscore}_id"] }
    @object = klass.find(params["#{klass.name.underscore}_id"])
  end

  def grid_params
    params.fetch(:characters_grid, { order: :last_name, descending: false }).permit!
  end

  # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(:name, :reason_for_name, :nickname, :reason_for_nickname, :ethnicity, :occupation_class,
                                      :social_class, :first_name, :middle_name, :last_name, :suffix, :birth_year, :death_year,
                                      :age_at_son, :father_id, :honorific, :grouping, :use_honorific_only, :background, :mother_id,
                                      :sex, :main, :thumbnail)
  end

  # Only allow a list of trusted parameters through.
  def attribute_params
    params.permit(:character,
                  :utf8, :_method, :authenticity_token, :book_id, :age, :year, :death_age, :button, :id, :story_id,
                  array_character_attributes)
  end

  def array_character_attributes
    [
      'physical appearance_age_value'.to_sym,
      'physical appearance_age appearance_value'.to_sym,
      'physical appearance_eye color_value'.to_sym,
      'physical appearance_glasses contacts_value'.to_sym,
      'physical appearance_hair color_value'.to_sym,
      'physical appearance_hair style_value'.to_sym,
      'physical appearance_weight_value'.to_sym,
      'physical appearance_height_value'.to_sym,
      'physical appearance_type of body_value'.to_sym,
      'physical appearance_skin tone_value'.to_sym,
      'physical appearance_skin type_value'.to_sym,
      'physical appearance_shape of face_value'.to_sym,
      'physical appearance_marks_value'.to_sym,
      'physical appearance_freckles_value'.to_sym,
      'physical appearance_moles_value'.to_sym,
      'physical appearance_scars_value'.to_sym,
      'physical appearance_predominate feature_value'.to_sym,
      'physical appearance_looks like_value'.to_sym,
      'physical appearance_healthy_value'.to_sym,
      'physical appearance_why not_value'.to_sym,
      'favorites_favorite color_value'.to_sym,
      'favorites_least favorite color_value'.to_sym,
      'favorites_why_value'.to_sym,
      'favorites_favorite music_value'.to_sym,
      'favorites_least favorite music_value'.to_sym,
      'favorites_food_value'.to_sym,
      'favorites_literature_value'.to_sym,
      'favorites_expressions_value'.to_sym,
      'favorites_expletives_value'.to_sym,
      'favorites_mode of trans_value'.to_sym,
      'favorites_daredevil cautious_value'.to_sym,
      'favorites_same alone_value'.to_sym,
      'favorites_habits_value'.to_sym,
      'favorites_drinks_value'.to_sym,
      'favorites_what_value'.to_sym,
      'favorites_when how much_value'.to_sym,
      'favorites_hobbies_value'.to_sym,
      'favorites_rainy day_value'.to_sym,
      'background_hometown_value'.to_sym,
      'background_type of childhood_value'.to_sym,
      'background_first memory_value'.to_sym,
      'background_most import childhood_value'.to_sym,
      'background_why most import_value'.to_sym,
      'background_education_value'.to_sym,
      'background_religion_value'.to_sym,
      'background_finances_value'.to_sym,
      'family_mother_value'.to_sym,
      'family_relationship with_value'.to_sym,
      'family_relation with mother_value'.to_sym,
      'family_father_value'.to_sym,
      'family_siblings_value'.to_sym,
      'family_how many_value'.to_sym,
      'family_birth order_value'.to_sym,
      'family_relationship with each_value'.to_sym,
      'family_child of siblings_value'.to_sym,
      'family_extended family_value'.to_sym,
      'family_close_value'.to_sym,
      'family_why why not_value'.to_sym,
      'attitude_most at ease_value'.to_sym,
      'attitude_ill at ease_value'.to_sym,
      'attitude_priorities_value'.to_sym,
      'attitude_philosophy_value'.to_sym,
      'attitude_feel about self_value'.to_sym,
      'attitude_past failures_value'.to_sym,
      'attitude_why_value'.to_sym,
      'attitude_one wish_value'.to_sym,
      'personality_great strength_value'.to_sym,
      'personality_great weakness_value'.to_sym,
      'personality_soft spot_value'.to_sym,
      'personality_obvious to others_value'.to_sym,
      'personality_how hide_value'.to_sym,
      'personality_biggest vulnerability_value'.to_sym,
      'traits_optimist pessimist_value'.to_sym,
      'traits_why_value'.to_sym,
      'traits_introvert extrovert_value'.to_sym,
      'traits_drives motivations_value'.to_sym,
      'traits_talents_value'.to_sym,
      'traits_extremely skilled_value'.to_sym,
      'traits_extremely unskilled_value'.to_sym,
      'traits_good characteristics_value'.to_sym,
      'traits_character flaws_value'.to_sym,
      'traits_mannerisms_value'.to_sym,
      'traits_peculiarities_value'.to_sym,
      'traits_biggest regret_value'.to_sym,
      'traits_minor regrets_value'.to_sym,
      'traits_darkest secret_value'.to_sym,
      'traits_anybody know_value'.to_sym,
      'traits_char tell them_value'.to_sym,
      'traits_how find out_value'.to_sym,
      'gender_gender_value'.to_sym
    ]
  end
end
