class CreateHelplists < ActiveRecord::Migration[5.0]
  def change
    create_table :helplists do |t|
      t.string :date
      t.string :starttime
      t.string :endtime
      t.references :store, foreign_key: true
      t.timestamps
    end
  end
end
