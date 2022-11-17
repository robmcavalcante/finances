class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :month, limit: 2
      t.string :year, limit: 4

      t.timestamps
    end
  end
end
