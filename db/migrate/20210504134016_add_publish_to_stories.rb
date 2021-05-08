class AddPublishToStories < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :publish, :boolean, :default => 1
  end
end
