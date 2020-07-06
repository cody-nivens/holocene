class AddEventSwitchChapter < ActiveRecord::Migration[5.2]
  def change
    add_column :chapters, :show_events, :boolean, :default => 1
  end
end
