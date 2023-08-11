class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :name
      t.bigint :user_id
      t.string :slug

      t.timestamps
    end
  end
end
