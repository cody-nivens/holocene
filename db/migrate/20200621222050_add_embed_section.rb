class AddEmbedSection < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :embed, :integer, default: 0
  end
end
