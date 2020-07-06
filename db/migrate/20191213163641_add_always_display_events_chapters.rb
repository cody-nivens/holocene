class AddAlwaysDisplayEventsChapters < ActiveRecord::Migration[5.2]
  def change
    add_column :chapters, :always_display_events, :boolean, :default => 0
  end
end
