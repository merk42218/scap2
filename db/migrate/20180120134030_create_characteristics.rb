class CreateCharacteristics < ActiveRecord::Migration[5.1]
  def change
    create_table :characteristics do |t|
      t.string :name, null: false
      t.references :information_system, foreign_key: true, null: false
      t.references :address, foreign_key: true, null: false
      t.integer :type_of_data, null: false
      t.integer :result_type, null: false

      t.timestamps
    end
  end
end
