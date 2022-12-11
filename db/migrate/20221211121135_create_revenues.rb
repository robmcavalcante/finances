class CreateRevenues < ActiveRecord::Migration[7.0]
  def change
    create_table :revenues do |t|
      t.string :description, limit: 50
      t.decimal :value, precision: 10, scale: 2

      t.timestamps
    end
  end
end
