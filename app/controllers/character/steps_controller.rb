class Character::StepsController < ApplicationController
  before_action :set_object, only: %i[ create show update finish_wizard_path ]

  #include Wicked::Wizard
  # steps *Character.form_steps
  #steps :characteristics, :identity, :attributes

  def create
    @character = Character.new
    @character.sex = rand(2)
    @character.user = current_user

    @character.save(validate: false)

    update_character_lists(@object, @character)
    @cs_path = "/character/#{@object.id}/steps"
    #redirect_to polymorphic_path([@object, @character, :step], id: Character.form_steps.first)
    respond_to do |format|
      format.turbo_stream { render "character/show", locals: { cs_path: @cs_path, wiz_step: :characteristics } }
    end
  end

  def show
    @character = Character.find(params[:character_id])
    @wiz_step = params[:wiz_step].nil? ? nil : params[:wiz_step].to_sym

    @character.update(character_step_params(@wiz_step))
    update_values

    @cs_path = "/character/#{@object.id}/steps"
    respond_to do |format|
      # case params[:id].to_sym
      case @wiz_step
      when :characteristics
        # NOTE: it's better to have a default value when params[:date] is empty
        #       on initial request.
        #       add links in step :one template with different date params
        #       when you click them, just let the page render again, there is
        #       no need to do anything else.
        @user = current_user
        set_attributes(:identity)
        @wiz_step = :identity
        format.turbo_stream { render "character/show", locals: { cs_path: @cs_path, wiz_step: :identity } }
      when :identity
        set_attributes(:attributes)
        format.turbo_stream { render "character/show", locals: { cs_path: @cs_path, wiz_step: :attributes } }
      when :attributes
        format.turbo_stream { render "shared/show", locals: { object: @character } }
      end
#      format.html { render_wizard }
    end
  end

  def update
    @character = Character.find(params[:character_id])
    my_step = step
    @character.update(character_params(step))
    update_values
    set_attributes(my_step)

    @cs_path = "/character/#{@object.id}/steps"
    respond_to do |format|
      format.turbo_stream { render "character/show", locals: { cs_path: @cs_path, step: } }
    end
  end

  def finish_wizard_path
    @character = Character.find(params[:character_id])
    case @object.class.name
    when 'Book'
      book_character_path(book_id: @object.id, id: @character.id)
    when 'Scene'
      scene_character_path(scene_id: @object.id, id: @character.id)
    else
      # when "Story"
      story_character_path(story_id: @object.id, id: @character.id)
    end
  end

  private

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

  def update_values
    CharacterCategory.all.each do |category|
      character_values = @character.character_values.joins(:character_attribute).order(:name).where(
        'character_category_id = ?', category.id
      )
      character_attributes = category.character_attributes
      character_attributes.each do |character_attribute|
        character_value = character_values.where(character_attribute_id: character_attribute.id)[0]
        field_name = "#{category.name.underscore}_#{character_attribute.name.underscore}_value".to_sym

        next if attribute_params[field_name].blank?

        update_value = CharacterValue.where({ character_attribute_id: character_attribute.id,
                                              character_id: @character.id }).first_or_create
        update_value.value = attribute_params[field_name]
        update_value.save
      end
    end
  end

  def set_attributes(my_step)
    case my_step
    when :characteristics
      @year = case @object.class.name
              when 'Scene'
                @object.date_string.to_date.year
              else
                ''
              end
    when :identity
      unless @character.first_name?
        values = Namer.random_name(@character.ethnicity, @character.sex)
        @character.first_name = values[0]
        @character.middle_name = values[1]
        @character.last_name = values[2]
      end
    else
      # when "attributes"
      if @character.character_values.length == 0
        case @character.ethnicity
        when 'White'
          hair_color = Character.gen_hair_color
          eye_color  = Character.gen_eye_color(hair_color)
        when 'Am Indian'
          hair_color = 'Black'
          eye_color = 'Brown'
        else
          hair_color = 'Black'
          eye_color = Character.gen_black_eye_color
        end
        sexuality = Character.gen_sexuality
        @attributes = {
          "physical appearance_hair color_value": hair_color,
          "physical appearance_eye color_value": eye_color,
          "gender_gender_value": sexuality
        }
      end
    end
  end

  def set_object
    klass = [Scene, Story, Book].detect { |c| params["#{c.name.underscore}_id"] }
    @object = klass.find(params["#{klass.name.underscore}_id"])
  end

    # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(:name, :reason_for_name, :nickname, :reason_for_nickname, :ethnicity, :occupation_class,
                                      :social_class, :first_name, :middle_name, :last_name, :suffix, :birth_year, :death_year,
                                      :age_at_son, :father_id, :honorific, :grouping, :use_honorific_only, :background, :mother_id,
                                      :sex, :main, :thumbnail)
  end

  def character_step_params(my_step)
    permitted_attributes = case my_step
                           when :identity
                             %i[first_name middle_name last_name suffix reason_for_name
                                nickname reason_for_nickname use_honorific_only honorific]
                           when :characteristics
                             %i[ethnicity birth_year death_year sex]
                           else
                             # when "attributes"
                             %i[occupation_class social_class grouping father_id mother_id]
                           end

      #.merge(form_step: my_step)
    params.require(:character).permit(permitted_attributes)
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
      'gender_gender_value'.to_sym,
      'gender_sex_value'.to_sym
    ]
  end
end
