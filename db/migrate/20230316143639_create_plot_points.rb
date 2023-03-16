class CreatePlotPoints < ActiveRecord::Migration[6.1]
  def change
    create_table :plot_points do |t|
      t.string :name
      t.bigint :book_id

      t.timestamps
    end
  end
end
