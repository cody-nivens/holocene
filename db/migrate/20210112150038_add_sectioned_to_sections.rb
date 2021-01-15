class AddSectionedToSections < ActiveRecord::Migration[6.0]
  def change
    add_reference :sections, :sectioned, polymorphic: true, null: false
  end
end
