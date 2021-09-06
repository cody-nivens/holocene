class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :name_ascii
      t.decimal :lat, precision: 10, scale: 4
      t.decimal :lng, precision: 10, scale: 4
      t.string :country
      t.string :iso2
      t.string :iso3
      t.string :admin_name
      t.string :capital
      t.bigint :population
      t.bigint :simple_map_id

      t.timestamps
    end
  end
end
