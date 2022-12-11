class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :description, limit: 50
      t.string :date, limit: 8
      t.decimal :value, precision: 10, scale: 2
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
