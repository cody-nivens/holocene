class AddPositionToStory < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :position, :integer
  end
end
