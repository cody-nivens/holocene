class CreateBiblioentries < ActiveRecord::Migration[5.2]
  def change
    create_table :biblioentries do |t|
      t.string :name
      t.string :xreflabel
      t.string :copyright_year
      t.string :copyright_holder
      t.string :publisher
      t.string :releaseinfo

      t.timestamps
    end
  end
end
