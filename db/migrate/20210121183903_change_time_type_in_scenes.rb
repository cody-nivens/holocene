class ChangeTimeTypeInScenes < ActiveRecord::Migration[6.0]
  def change
    change_column :scenes, :time, :decimal, using: 'time::decimal'
  end
end
