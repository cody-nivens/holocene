class CreateHoloceneEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :holocene_events do |t|
      t.string :name
      t.integer :start_year
      t.integer :end_year
      t.integer :start_year_uncert
      t.integer :start_year_mod
      t.integer :end_year_uncert
      t.integer :end_year_mod
      t.references :event_type
      t.references :region
      t.string :image
      t.string :url
      t.text :body
      t.string :slug

      t.timestamps
    end
  end
end
