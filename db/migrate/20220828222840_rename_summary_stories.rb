class RenameSummaryStories < ActiveRecord::Migration[6.1]
  def change
    remove_column :stories, :summary
  end
end
