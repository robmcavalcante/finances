class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :situation
      t.string :date, limit: 8
      t.string :description, limit: 40
      t.float :value
      t.references :invoice, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
