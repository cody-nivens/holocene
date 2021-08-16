class AddPostionToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :position, :integer
  end
end
