class ChangeFatherType < ActiveRecord::Migration[7.0]
  def change
    change_column :characters, :father_id, :bigint, null: true
  end
end
