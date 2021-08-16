class AddUserToSections < ActiveRecord::Migration[6.0]
  def change
    add_reference :sections, :user, null: false
  end
end
