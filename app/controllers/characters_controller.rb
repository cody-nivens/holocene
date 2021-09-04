class CharactersController < ApplicationController
  before_action :set_character, only: [:lineage, :show, :edit, :update, :destroy]
  before_action :set_object, only: [:lineage, :index, :add, :list, :edit, :show, :create, :update, :destroy ]

  # GET /characters
  # GET /characters.json
  def index
    if params[:ethnicity].nil? && params[:occupation_class].nil? && params[:cat1].nil? && params[:attrib1].nil? || !params[:last_name].nil?
      if !params[:last_name].blank?
        @characters = @object.characters.where("last_name like ?","#{params[:last_name]}%").order(:last_name,:first_name)
      else
        @characters = @object.characters.order(:last_name,:first_name)
      end
      @title = "Characters"
    else
    if !params[:occupation_class].blank?
      @characters = @object.characters.where("occupation_class = ?", params[:occupation_class])
      @title = "Occupation Class: #{params[:occupation_class]}"
    elsif !params[:ethnicity].blank?
      @characters = @object.characters.where("ethnicity = ?", params[:ethnicity])
      @title = "Ethnicity"
    elsif !params[:cat1].blank? && !params[:cat2].blank?
      cat_text_1 = params[:cat1]
      cat_text_2 = params[:cat2]

      key_1 = params[:key1]
      key_2 = params[:key2]
      cat_1 = CharacterAttribute.where(name: cat_text_1)[0]
      cat_2 = cat_text_2

      first_count = CharacterValue.where(character_attribute_id: cat_1.id, value: key_1)
      #count_2 = Character.where("#{cat_2} =?",Character.text_to_sex(key_2))

      intersect = @object.characters.where("#{cat_2} = ?",(key_2 == 'sex' ? Character.text_to_sex(key_2) : key_2)).pluck(:id).intersection(first_count.pluck(:character_id))

      @characters = @object.characters.where(id: intersect)

    elsif !params[:attrib1].blank? && !params[:attrib2].blank?
      attrib_1 = params[:attrib1]
      attrib_2 = params[:attrib2]

      key_1 = params[:key1]
      key_2 = params[:key2]

      first_count = @object.characters.where("#{attrib_1} = ?", key_1)

      intersect = @object.characters.where("#{attrib_2} = ?",(key_2 == 'sex' ? Character.text_to_sex(key_2) : key_2)).pluck(:id).intersection(first_count.pluck(:id))

      @characters = @object.characters.where(id: intersect)

    elsif !params[:cat1].blank?
      cat_text_1 = params[:cat1]

      key_1 = params[:key1]
      cat_1 = CharacterAttribute.where(name: cat_text_1)[0]

      first_count = CharacterValue.where(character_attribute_id: cat_1.id, value: key_1)

      @characters = @object.characters.where(id: first_count.pluck(:character_id))

      @title = "Stats"
    else
      if !params[:ethnicity].nil? && params[:ethnicity].blank?
        @characters = @object.characters.where(ethnicity: nil)
        @title = "Ethnicity"
      end
      if !params[:occupation_class].nil? && params[:occupation_class].blank?
        @characters = @object.characters.where(occupation_class: nil)
        @title = "Occupation Class"
      end
    end
    end
    respond_to do |format|
      format.js {}
      format.html {}
    end

  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  def lineage
  end

  # GET /characters/1/list
  def list
  end

  def update_character_lists(object,character)
    object.characters << character unless object.characters.include?(character)
    case object.class.name
    when "Story"
      object.book.characters << character unless object.book.characters.include?(character)
    when "Scene"
      object.key_point.scripted.book.characters << character unless object.key_point.scripted.book.characters.include?(character)
      object.key_point.scripted.characters << character unless object.key_point.scripted.characters.include?(character)
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
        update_character_lists(@object,character)
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
       format.html { redirect_to polymorphic_path([ @object, :characters_list])}
    end
  end

  # POST /characters
  # GET /characters/1/edit
  def edit
  end

  def update_values
    CharacterCategory.all.each do |category|
      character_values = @character.character_values.joins(:character_attribute).order(:name).where("character_category_id = ?", category.id)
      character_attributes = category.character_attributes
      character_attributes.each do |character_attribute|
        character_value = character_values.where(character_attribute_id: character_attribute.id)[0]
        field_name = "#{category.name.underscore}_#{character_attribute.name.underscore}_value".to_sym

        if !attribute_params[field_name].blank?
          if attribute_params[field_name] == "---"
            update_value = CharacterValue.where({:character_attribute_id => character_attribute.id, :character_id => @character.id }).first_or_create
            update_value.destroy
          else
            update_value = CharacterValue.where({:character_attribute_id => character_attribute.id, :character_id => @character.id }).first_or_create
            update_value.value = attribute_params[field_name]
            update_value.save
          end
        end
      end
    end
  end

  # POST /characters
  # POST /characters.json
  def create

    @character = Character.new
    @character.sex = rand(2)

    @character.save(validate: false)

    update_character_lists(@object,@character)
    case @object.class.name
    when "Book"
      redirect_to book_character_step_path(@object, @character, Character.form_steps.first)
    when "Scene"
      redirect_to scene_character_step_path(@object, @character, Character.form_steps.first)
    when "Story"
      redirect_to story_character_step_path(@object, @character, Character.form_steps.first)
    end

  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    update_values
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to polymorphic_path([@object, @character]) }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_url([@object, :characters]), notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    def set_object
    klass = [Scene, Story, Book].detect{|c| params["#{c.name.underscore}_id"]}
    @object = klass.find(params["#{klass.name.underscore}_id"])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :reason_for_name, :nickname, :reason_for_nickname, :ethnicity, :occupation_class, 
                                        :social_class, :first_name, :middle_name, :last_name, :suffix, :birth_year, :death_year,
                                       :age_at_son, :father_id, :honorific, :grouping, :use_honorific_only,:background,:mother_id,:sex
                                       )
    end

    # Only allow a list of trusted parameters through.
    def attribute_params
      params.permit(:character,
                    :utf8, :_method, :authenticity_token, :book_id, :age, :year, :death_age, :button, :id, :story_id,
                                       array_character_attributes
                                       )
    end

    def array_character_attributes
     [
 "physical appearance_age_value".to_sym,
 "physical appearance_age appearance_value".to_sym,
 "physical appearance_eye color_value".to_sym,
 "physical appearance_glasses contacts_value".to_sym,
 "physical appearance_hair color_value".to_sym,
 "physical appearance_hair style_value".to_sym,
 "physical appearance_weight_value".to_sym,
 "physical appearance_height_value".to_sym,
 "physical appearance_type of body_value".to_sym,
 "physical appearance_skin tone_value".to_sym,
 "physical appearance_skin type_value".to_sym,
 "physical appearance_shape of face_value".to_sym,
 "physical appearance_marks_value".to_sym,
 "physical appearance_freckles_value".to_sym,
 "physical appearance_moles_value".to_sym,
 "physical appearance_scars_value".to_sym,
 "physical appearance_predominate feature_value".to_sym,
 "physical appearance_looks like_value".to_sym,
 "physical appearance_healthy_value".to_sym,
 "physical appearance_why not_value".to_sym,
 "favorites_favorite color_value".to_sym,
 "favorites_least favorite color_value".to_sym,
 "favorites_why_value".to_sym,
 "favorites_favorite music_value".to_sym,
 "favorites_least favorite music_value".to_sym,
 "favorites_food_value".to_sym,
 "favorites_literature_value".to_sym,
 "favorites_expressions_value".to_sym,
 "favorites_expletives_value".to_sym,
 "favorites_mode of trans_value".to_sym,
 "favorites_daredevil cautious_value".to_sym,
 "favorites_same alone_value".to_sym,
 "favorites_habits_value".to_sym,
 "favorites_drinks_value".to_sym,
 "favorites_what_value".to_sym,
 "favorites_when how much_value".to_sym,
 "favorites_hobbies_value".to_sym,
 "favorites_rainy day_value".to_sym,
 "background_hometown_value".to_sym,
 "background_type of childhood_value".to_sym,
 "background_first memory_value".to_sym,
 "background_most import childhood_value".to_sym,
 "background_why most import_value".to_sym,
 "background_education_value".to_sym,
 "background_religion_value".to_sym,
 "background_finances_value".to_sym,
 "family_mother_value".to_sym,
 "family_relationship with_value".to_sym,
 "family_relation with mother_value".to_sym,
 "family_father_value".to_sym,
 "family_siblings_value".to_sym,
 "family_how many_value".to_sym,
 "family_birth order_value".to_sym,
 "family_relationship with each_value".to_sym,
 "family_child of siblings_value".to_sym,
 "family_extended family_value".to_sym,
 "family_close_value".to_sym,
 "family_why why not_value".to_sym,
 "attitude_most at ease_value".to_sym,
 "attitude_ill at ease_value".to_sym,
 "attitude_priorities_value".to_sym,
 "attitude_philosophy_value".to_sym,
 "attitude_feel about self_value".to_sym,
 "attitude_past failures_value".to_sym,
 "attitude_why_value".to_sym,
 "attitude_one wish_value".to_sym,
 "personality_great strength_value".to_sym,
 "personality_great weakness_value".to_sym,
 "personality_soft spot_value".to_sym,
 "personality_obvious to others_value".to_sym,
 "personality_how hide_value".to_sym,
 "personality_biggest vulnerability_value".to_sym,
 "traits_optimist pessimist_value".to_sym,
 "traits_why_value".to_sym,
 "traits_introvert extrovert_value".to_sym,
 "traits_drives motivations_value".to_sym,
 "traits_talents_value".to_sym,
 "traits_extremely skilled_value".to_sym,
 "traits_extremely unskilled_value".to_sym,
 "traits_good characteristics_value".to_sym,
 "traits_character flaws_value".to_sym,
 "traits_mannerisms_value".to_sym,
 "traits_peculiarities_value".to_sym,
 "traits_biggest regret_value".to_sym,
 "traits_minor regrets_value".to_sym,
 "traits_darkest secret_value".to_sym,
 "traits_anybody know_value".to_sym,
 "traits_char tell them_value".to_sym,
 "traits_how find out_value".to_sym,
 "gender_gender_value".to_sym
     ]
    end
end
