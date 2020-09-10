class AddScriptedToChapter < ActiveRecord::Migration[6.0]
  def change
    add_reference :chapters, :scripted, polymorphic: true, null: false
  end
end
