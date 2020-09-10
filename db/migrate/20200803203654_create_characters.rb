class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :reason_for_name
      t.string :nickname
      t.string :reason_for_nickname
      t.string :race
      t.string :occupation_class
      t.string :social_class

      t.timestamps
    end
  end
end
