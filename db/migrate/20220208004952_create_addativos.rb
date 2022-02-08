class CreateAddativos < ActiveRecord::Migration[5.2]
  def change
    create_table :addativos do |t|
      t.references :vinculo, foreign_key: true
      t.string :tombo
      t.string :description
      t.string :condition
      t.string :situation

      t.timestamps
    end
  end
end
