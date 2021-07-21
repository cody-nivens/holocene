class AddStandAloneToStory < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :stand_alone, :boolean, :default => false
  end
end
