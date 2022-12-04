class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :description, limit: 50
      t.string :date, limit: 8
      t.float :value
      t.integer :status, limit: 1

      t.timestamps
    end
  end
end
