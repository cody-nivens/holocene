class CreateNamers < ActiveRecord::Migration[6.0]
  def change
    create_table :namers do |t|
      t.string :name
      t.boolean :first_name, default: false
      t.decimal :white, precision: 5, scale: 3
      t.decimal :black, precision: 5, scale: 3
      t.decimal :asian, precision: 5, scale: 3
      t.decimal :indian, precision: 5, scale: 3
      t.decimal :latino_mixed, precision: 5, scale: 3
      t.decimal :latino, precision: 5, scale: 3
      t.string :gender

      t.timestamps
    end
  end
end
