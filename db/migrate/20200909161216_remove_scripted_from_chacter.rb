class RemoveScriptedFromChacter < ActiveRecord::Migration[6.0]
  def change
    remove_column :characters, :scripted_type
    remove_column :characters, :scripted_id
  end
end
