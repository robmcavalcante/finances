class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :description, limit: 20
      t.float :value
      t.references :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
