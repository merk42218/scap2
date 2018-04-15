class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.string :calculated_field,  null: false
      t.integer :operation, null: false
      t.references :characteristic, foreign_key: true, null: false
      t.integer :employ, null: false
      t.time :ctime, null: false


      t.timestamps
    end
  end
end
