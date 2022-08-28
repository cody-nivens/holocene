class AddTItlePageFlagStories < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :title_page, :boolean, default: false
  end
end
