class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :description, limit: 30
      t.string :flag, limit: 20
      t.integer :limit
      t.string :closure, limit: 2
      t.string :expiration, limit: 2

      t.timestamps
    end
  end
end
