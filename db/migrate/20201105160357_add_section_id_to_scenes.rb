class AddSectionIdToScenes < ActiveRecord::Migration[6.0]
  def change
    add_column :scenes, :section_id, :bigint
  end
end
