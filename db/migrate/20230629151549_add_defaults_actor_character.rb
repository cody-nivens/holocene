class AddDefaultsActorCharacter < ActiveRecord::Migration[7.0]
  def change
    change_column :actor_characters, :character_id, :bigint, null: false
    change_column :actor_characters, :actor_id, :bigint, null: false
    change_column :actor_location_times, :actor_id, :bigint, null: false
    change_column :actor_location_times, :location_time_id, :bigint, null: false
  end
end
