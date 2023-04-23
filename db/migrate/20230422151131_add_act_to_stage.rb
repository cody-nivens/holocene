class AddActToStage < ActiveRecord::Migration[6.1]
  def change
    add_column :stages, :act_id, :bigint
  end
end
