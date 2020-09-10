class CreateKeyPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :key_points do |t|
      t.text :hook
      t.string :inciting_incident
      t.string :key_element
      t.string :first_plot_point
      t.string :first_pinch_point
      t.string :midpoint
      t.string :second_pinch_point
      t.string :third_plot_point
      t.string :climax

      t.timestamps
    end
  end
end
