class CreateWeights < ActiveRecord::Migration[5.1]
  def change
    create_table :weights do |t|
      t.string :name, null: false
      t.integer :weight
      t.references :part_of_characteristic, foreign_key: true, null: false

      t.timestamps
    end
  end
end
