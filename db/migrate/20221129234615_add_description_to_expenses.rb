class AddDescriptionToExpenses < ActiveRecord::Migration[7.0]
  def change
    add_column :expenses, :description, :string, limit: 20
  end
end
