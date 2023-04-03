Character.has_many :character_values

class CharactersGrid < BaseGrid
  scope do
    Character.all.order(:last_name, :first_name)
  end

  attr_accessor(:object)

  filter(:last_name, :string, header: 'Last Name LIKE') do |value|
    where('LOWER( last_name ) like ?', "%#{value}%")
  end

  filter(:first_name, :string, header: 'First Name LIKE') do |value|
    where('LOWER( first_name ) like ?', "%#{value}%")
  end

  filter(:main, :boolean)
  filter(:no_ethnicity, :boolean, default: false, dummy: true)

  filter(:ethnicity, :enum, select: proc {
    Character.all.pluck(:ethnicity).compact.sort.uniq.drop(1).map do |c|
      [c, c]
    end
  }, multiple: true)

  filter(:occupation_class, :enum, select: proc {
                                             Character.all.pluck(:occupation_class).compact.sort.uniq.map do |c|
                                               [c, c]
                                             end
                                           }, multiple: true)
  filter(:no_grouping, :boolean, default: false, dummy: true)

  filter(:grouping, :enum, select: proc {
    Character.all.pluck(:grouping).compact.sort.uniq.drop(1).map do |c|
      [c, c]
    end
  }, multiple: true)
  filter(:category, :enum, select: proc {
                                     CharacterCategory.all.order(:name).pluck(:name, :id).compact.sort.uniq.map do |c|
                                       [c[0], c[1]]
                                     end
                                   }, default: proc {
                                                 @category
                                               })
  filter(:attribute, :enum, select: proc {
                                      CharacterAttribute.where(character_category_id: CharacterCategory.all.order(:name).first).pluck(:name, :id).compact.sort.uniq.map do |c|
                                        [c[0], c[1]]
                                      end
                                    }, default: proc {
                                                  @attribute
                                                })
  filter(:value, :enum, select: proc {
                                  CharacterValue.where(character_attribute_id: CharacterAttribute.all.order(:name).first).pluck(:value, :id).compact.sort.uniq.map do |c|
                                    [c[0], c[1]]
                                  end
                                }, default: proc {
                                              @value
                                            })

  column(:last_name, header: 'Name', html: true, order: 'last_name asc, first_name asc, suffix asc',
                     order_desc: 'last_name desc, first_name desc, suffix desc') do |he|
    link_to he.full_last_first, polymorphic_path([@object, he])
  end
  #column(:nickname)
  #column(:honorific)
  # column(:reason_for_name)
  # column(:reason_for_nickname)

  column(:occupation_class, order: 'occupation_class asc, last_name asc, first_name asc',
                            order_desc: 'occupation_class desc, last_name desc, first_name desc')
  column(:grouping, order: 'occupation_class asc, last_name asc, first_name asc',
                    order_desc: 'occupation_class desc, last_name desc, first_name desc')
  # column(:social_class)
  # column(:created_at)
  # column(:updated_at)
  column(:birth_year, if: ->(grid) { grid.object.class.name != 'Scene' }, order: 'birth_year asc, last_name asc, first_name asc',
                      order_desc: 'birth_year desc, last_name desc, first_name desc')
  column(:death_year, if: ->(grid) { grid.object.class.name != 'Scene' }, order: 'death_year asc, last_name asc, first_name asc',
                      order_desc: 'death_year desc, last_name desc, first_name desc')
  # column(:father_id)
  # column(:age_at_son)
  # column(:mother_id)

  column(:age, header: 'Age', html: true) do |character|
    @object.class.name == 'Scene' ? @object.date_string[0..3].to_i - character.birth_year.to_i : ''
  end
  column(:scenes, header: 'Scenes', html: true) do |character|
    character.scenes.size
  end

  column(:sex, html: true, order: 'sex asc, last_name asc, first_name asc',
               order_desc: 'sex desc, last_name desc, first_name desc') do |value|
    Character.sex_to_text(value.sex)
  end
  column(:gender, header: 'Gender', html: true) do |character|
    character_values = character.character_values.where(character_attribute_id: CharacterAttribute.all.joins(:character_category).where(
      'character_categories.name = ? and character_attributes.name= ?', 'Gender', 'Gender'
    )[0].id)
    character_values[0].value unless character_values.empty?
  end
  column(:ethnicity, order: 'ethnicity asc, last_name asc, first_name asc',
                     order_desc: 'ethnicity desc, last_name desc, first_name desc')
  column(:char_scenes, header: 'Role', if: ->(grid) { grid.object.class.name == 'Scene' }, html: true) do |character|
   character_scene = CharacterScene.where(character_id: character.id, scene_id: @object.id)
   link_to (fa_icon 'plus'), character_scene[0].nil? ? edit_character_scene_path(character.id, nil) : edit_character_scene_path(character_scene[0]), 
     data: { "bs-toggle": "tooltip", "bs-placement": "top", "bs-html":"true", "bs-title": "#{character_scene[0].nil? ? "Edit Character Scene" : character_scene[0].summary.to_plain_text}" }
  end
  column(:action2, header: '', html: true) do |character|
    link_to (fa_icon 'edit'), polymorphic_path([:edit,@object,character]), title: 'Edit'
  end
  column(:action3, header: '', html: true) do |character|
    link_to (fa_icon 'trash'), polymorphic_path([@object, character]), method: :delete,
                                                                         data: { confirm: 'Are you sure?' }, title: 'Destroy'
  end
end
