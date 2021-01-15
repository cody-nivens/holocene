class AddFlagsToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :grouping, :string
    add_column :characters, :use_honorific_only, :boolean, :default => false
  end
end
