class AddNameToActions < ActiveRecord::Migration[6.1]
  def change
    add_column :actions, :name, :string
  end
end
