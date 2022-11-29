class AddDayToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :day, :string, limit: 2
  end
end
