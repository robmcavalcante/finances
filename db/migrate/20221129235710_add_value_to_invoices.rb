class AddValueToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :value, :float
  end
end
