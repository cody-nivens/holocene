class AddPrintSummaryToStory < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :print_summary, :boolean, :default => false
  end
end
