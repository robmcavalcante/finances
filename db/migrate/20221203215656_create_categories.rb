class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :description, limit: 20
      t.string :color, limit: 20

      t.timestamps
    end
  end
end
