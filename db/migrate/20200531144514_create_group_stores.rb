class CreateGroupStores < ActiveRecord::Migration[5.0]
  def change
    create_table :group_stores do |t|
      t.references :group, foreign_key: true
      t.references :store, foreign_key: true
      t.timestamps
    end
  end
end
