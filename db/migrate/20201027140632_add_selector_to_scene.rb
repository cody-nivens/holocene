class AddSelectorToScene < ActiveRecord::Migration[6.0]
  def change
    add_column :scenes, :selector, :integer, default: 0
  end
end
