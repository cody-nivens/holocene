class AddHonorificToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :honorific, :string
  end
end
