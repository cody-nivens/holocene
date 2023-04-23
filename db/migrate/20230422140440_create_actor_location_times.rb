class CreateActorLocationTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :actor_location_times do |t|
      t.bigint :actor_id
      t.bigint :location_time_id

      t.timestamps
    end
  end
end
