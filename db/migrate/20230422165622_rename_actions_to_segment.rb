class RenameActionsToSegment < ActiveRecord::Migration[6.1]
  def change
    rename_table :actions, :segments
  end
end
