class CreateEpochs < ActiveRecord::Migration[5.2]
  def change
    create_table :epochs do |t|
      t.string :name
      t.integer :start_date
      t.integer :end_date
      t.text   :body

      t.timestamps
    end
  end
end
