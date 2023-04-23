class CreateActorCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :actor_characters do |t|
      t.bigint :actor_id
      t.bigint :character_id

      t.timestamps
    end
  end
end
