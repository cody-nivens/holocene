Character.has_many :character_values

class CharactersGrid < BaseGrid

  scope do
      Character.all.order(:last_name,:first_name)
  end

  attr_accessor(:object)

  filter(:last_name, :string, header: "Last Name LIKE") do |value|
    self.where("LOWER( last_name ) like ?","%#{value}%")
  end

  filter(:first_name, :string, header: "First Name LIKE") do |value|
    self.where("LOWER( first_name ) like ?","%#{value}%")
  end

  filter(:ethnicity, :enum, :select => proc { Character.all.pluck(:ethnicity).compact.sort.uniq.map {|c| [c, c] }}, :multiple => true)
  filter(:occupation_class, :enum, :select => proc { Character.all.pluck(:occupation_class).compact.sort.uniq.map {|c| [c, c] }}, :multiple => true)
  filter(:grouping, :enum, :select => proc { Character.all.pluck(:grouping).compact.sort.uniq.map {|c| [c, c] }}, :multiple => true)
  filter(:category, :enum, :select => proc { CharacterCategory.all.order(:name).pluck(:name, :id).compact.sort.uniq.map {|c| [c[0], c[1]] }})
  filter(:attribute, :enum, :select => proc { CharacterAttribute.where(character_category_id: CharacterCategory.all.order(:name).first).pluck(:name,:id).compact.sort.uniq.map {|c| [c[0], c[1]] }} )
  filter(:value, :enum, :select => proc { CharacterValue.where(character_attribute_id: CharacterAttribute.all.order(:name).first).pluck(:value,:id).compact.sort.uniq.map {|c| [c[0], c[1]] }} )

  column(:last_name, :html => true,:order=>'last_name asc, first_name asc, suffix asc',:order_desc=>'last_name desc, first_name desc, suffix desc') do |he|
    link_to he.last_name, polymorphic_path([@object,he])
  end

  column(:first_name, :html => true,:order=>'first_name asc, first_name asc, suffix asc',:order_desc=>'first_name desc, first_name desc, suffix desc') do |he|
    link_to he.first_name, polymorphic_path([@object,he])
  end
  column(:middle_name)
  column(:suffix)
  column(:honorific)
  column(:use_honorific_only)
  column(:sex, :html => true) do |value|
    Character.sex_to_text(value.sex)
  end
  #column(:reason_for_name)
  #column(:nickname)
  #column(:reason_for_nickname)
  column(:ethnicity,:order=>'ethnicity asc, last_name asc, first_name asc',:order_desc=>'ethnicity desc, last_name desc, first_name desc')

  column(:occupation_class,:order=>'occupation_class asc, last_name asc, first_name asc',:order_desc=>'occupation_class desc, last_name desc, first_name desc')
  column(:grouping,:order=>'occupation_class asc, last_name asc, first_name asc',:order_desc=>'occupation_class desc, last_name desc, first_name desc')
  #column(:social_class)
  #column(:created_at)
  #column(:updated_at)
  column(:birth_year)
  column(:death_year)

  #column(:father_id)
  #column(:age_at_son)
  #column(:mother_id)
 
  column(:gender, :header => "Gender", :html => true) do |character|
    character_values = character.character_values.where(character_attribute_id: CharacterAttribute.all.joins(:character_category).where("character_categories.name = ? and character_attributes.name= ?","Gender","Gender")[0].id)
    unless character_values.empty?
      character_values[0].value
    end
  end
  column(:action2, :header => "", :html => true) do |character|
    link_to (fa_icon "edit"), edit_book_character_path(@object,character), :title => 'Edit'
  end
  column(:action3, :header => "", :html => true) do |character|
    link_to (fa_icon "trash-o"), book_character_path(@object,character), method: :delete, data: { confirm: 'Are you sure?' }, :title => 'Destroy'
  end
end
