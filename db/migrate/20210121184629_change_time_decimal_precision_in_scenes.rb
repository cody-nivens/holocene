class ChangeTimeDecimalPrecisionInScenes < ActiveRecord::Migration[6.0]
  def change
    change_column :scenes, :time, :decimal, precision: 10, scale: 4
  end
end
