class CreateCharacteristicValues < ActiveRecord::Migration[5.1]
  def change
    create_table :characteristic_values do |t|
      t.string :value , null: false
      t.references :part_of_characteristic, foreign_key: true, null: false
      t.references :connection, foreign_key: true, null: false
      t.references :person, foreign_key: true, null: false
      t.datetime :time, null: false

      t.timestamps
    end
  end
end
