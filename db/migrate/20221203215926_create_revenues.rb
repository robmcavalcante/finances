class CreateRevenues < ActiveRecord::Migration[7.0]
  def change
    create_table :revenues do |t|
      t.string :description, limit: 50
      t.float :value

      t.timestamps
    end
  end
end
