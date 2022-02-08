class CreateAtivos < ActiveRecord::Migration[5.2]
  def change
    create_table :ativos do |t|
      t.references :type, foreign_key: true
      t.string :description
      t.string :serial
      t.string :tombo
      t.text :specification
      t.string :invoice
      t.date :date_acquisition
      t.string :warranty
      t.string :ata
      t.string :bidding

      t.timestamps
    end
  end
end
