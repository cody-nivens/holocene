class AddDateStringToScene < ActiveRecord::Migration[6.0]
  def change
    add_column :scenes, :date_string, :string
  end
end
