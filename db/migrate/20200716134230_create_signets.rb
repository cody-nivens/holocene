class CreateSignets < ActiveRecord::Migration[6.0]
  def change
    create_table :signets do |t|
      t.string :color
      t.string :message
      t.string :sigged_type
      t.integer :sigged_id

      t.timestamps
    end
  end
end
