class AddSuffixToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :suffix, :string
  end
end
