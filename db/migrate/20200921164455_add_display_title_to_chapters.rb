class AddDisplayTitleToChapters < ActiveRecord::Migration[6.0]
  def change
    add_column :chapters, :display_title, :boolean, :default => 1
  end
end
