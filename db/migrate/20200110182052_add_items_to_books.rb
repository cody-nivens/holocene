class AddItemsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :sub_name, :string
    add_column :books, :copyright, :string
    add_column :books, :publisher, :text
  end
end
