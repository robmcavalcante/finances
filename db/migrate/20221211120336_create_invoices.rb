class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :reference, limit: 8
      t.decimal :value, precision: 10, scale: 2
      t.integer :status, default: 0
      t.references :card, null: false, foreign_key: true
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
