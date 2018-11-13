class AddUserColumn < ActiveRecord::Migration[5.2]
  def change
      add_column :books, :user_id, :integer
      add_column :authors, :user_id, :integer
      add_column :biblioentries, :user_id, :integer
      add_column :event_types, :user_id, :integer
      add_column :regions, :user_id, :integer
      add_column :citations, :user_id, :integer
      add_column :holocene_events, :user_id, :integer
      add_column :timelines, :user_id, :integer
      add_column :epochs, :user_id, :integer
  end
end
