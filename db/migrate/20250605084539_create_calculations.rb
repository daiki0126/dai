class CreateCalculations < ActiveRecord::Migration[8.0]
  def change
    create_table :calculations do |t|
      t.date :date
      t.integer :amount
      t.string :category
      t.text :note
      t.string :calculation_type
      t.string :string
      t.integer :category_id

      t.timestamps
    end
  end
end
