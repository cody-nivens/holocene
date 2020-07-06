class AddShowEventsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :show_events, :boolean, :default => 1
  end
end
