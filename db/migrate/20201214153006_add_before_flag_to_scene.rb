class AddBeforeFlagToScene < ActiveRecord::Migration[6.0]
  def change
    add_column :scenes, :before_flag, :boolean, default: false
  end
end
