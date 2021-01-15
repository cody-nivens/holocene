class AddFictionToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :fiction, :boolean
  end
end
