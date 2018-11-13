class AddBibiloentryColumn < ActiveRecord::Migration[5.2]
  def change
      add_column :citations, :biblioentry_id, :integer
  end
end
