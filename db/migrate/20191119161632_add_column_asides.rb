class AddColumnAsides < ActiveRecord::Migration[5.2]
  def change
    add_column :asides, :chapter_id, :integer
  end
end
