class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :year, limit: 4
      t.string :month, limit: 2

      t.timestamps
    end
  end
end
