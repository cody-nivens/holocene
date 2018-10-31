class CreateEras < ActiveRecord::Migration[5.2]
  def change
    create_table :eras do |t|
      t.string :name
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
