class AddGisColumnToHoloceneEvents < ActiveRecord::Migration[5.2]
  def change
      add_column :holocene_events, :lat, :decimal, precision: 10, scale: 6
      add_column :holocene_events, :lng, :decimal, precision: 10, scale: 6
  end
end
