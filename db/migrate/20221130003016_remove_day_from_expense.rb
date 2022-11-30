class RemoveDayFromExpense < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :day, :string
  end
end
