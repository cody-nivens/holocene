class AddScriptedToKeyPoints < ActiveRecord::Migration[6.0]
  def change
    add_reference :key_points, :scripted, polymorphic: true, index: true
  end
end
