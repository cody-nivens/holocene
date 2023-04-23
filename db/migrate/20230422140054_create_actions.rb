class CreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.bigint :stage_id
      t.bigint :location_id

      t.timestamps
    end
  end
end
