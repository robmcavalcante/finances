class RemoveYearFromExpense < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :year, :string
  end
end
