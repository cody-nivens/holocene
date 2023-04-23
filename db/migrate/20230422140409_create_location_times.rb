class CreateLocationTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :location_times do |t|
      t.bigint :location_id
      t.bigint :stage_id
      t.string :date_string

      t.timestamps
    end
  end
end
