class CreateSubareas < ActiveRecord::Migration[5.2]
  def change
    create_table :subareas do |t|
      t.string :description
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
