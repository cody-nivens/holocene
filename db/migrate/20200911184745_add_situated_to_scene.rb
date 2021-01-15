class AddSituatedToScene < ActiveRecord::Migration[6.0]
  def change
    add_reference :scenes, :situated, polymorphic: true, null: false
  end
end
