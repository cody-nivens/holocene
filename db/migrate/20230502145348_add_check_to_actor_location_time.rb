class AddCheckToActorLocationTime < ActiveRecord::Migration[6.1]
  def change
    add_column :actor_location_times, :check, :boolean, default: false
  end
end
