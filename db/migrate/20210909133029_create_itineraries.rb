class CreateItineraries < ActiveRecord::Migration[6.0]
  def change
    create_table :itineraries do |t|
      t.string :name
      t.references :tour, null: false
      t.references :city, null: false
      t.integer :position
      t.integer :stay, default: 0

      t.timestamps
    end
  end
end
