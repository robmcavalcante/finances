class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :description, limit: 50
      t.string :date, limit: 8
      t.decimal :value, precision: 10, scale: 2
      t.references :category, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
