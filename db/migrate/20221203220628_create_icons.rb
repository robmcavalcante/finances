class CreateIcons < ActiveRecord::Migration[7.0]
  def change
    create_table :icons do |t|
      t.string :value, limit: 30
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
