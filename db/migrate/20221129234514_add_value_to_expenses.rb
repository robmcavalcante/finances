class AddValueToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :value, :float
  end
end
