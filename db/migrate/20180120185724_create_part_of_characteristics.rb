class CreatePartOfCharacteristics < ActiveRecord::Migration[5.1]
  def change
    create_table :part_of_characteristics do |t|
      t.string :partname, null: false
      t.references :characteristic, foreign_key: true
      t.integer :isweight, null: false,   :default => 1
      t.integer :type_of_data, null: false
      t.integer :result_type, null: false,  :default => 1
      t.timestamps
    end
  end
end
