class CreateUserData < ActiveRecord::Migration[7.0]
  def change
    create_table :user_data do |t|
      t.bigint :user_id
      t.bigint :book_id
      t.bigint :chapter_id
      t.bigint :story_id
      t.bigint :scene_id
      t.bigint :stage_id
      t.integer :wc_low, default: 250
      t.integer :wc_mid, default: 650
      t.integer :wc_better, default: 1000

      t.timestamps
    end
  end
end
