class CreateMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :metrics do |t|
      t.integer :count
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.references :metrized, polymorphic: true, null: false

      t.timestamps
    end
  end
end
