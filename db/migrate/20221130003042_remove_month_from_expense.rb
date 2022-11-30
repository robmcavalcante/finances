class RemoveMonthFromExpense < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :month, :string
  end
end
