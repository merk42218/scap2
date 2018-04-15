class CreateComponents < ActiveRecord::Migration[5.1]
  def change
    create_table :components do |t|
      t.references :characteristic, foreign_key: true
      t.references :part_of_characteristics, foreign_key: true
      t.integer :sampling_step
      t.integer :pid

      t.timestamps
    end
  end
end
