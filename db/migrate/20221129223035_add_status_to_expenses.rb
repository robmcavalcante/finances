class AddStatusToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :status, :integer, limit: 1
  end
end
