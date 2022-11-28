class CreateIcons < ActiveRecord::Migration[7.0]
  def change
    create_table :icons do |t|
      t.string :name, limit: 20
      t.string :class, limit: 75

      t.timestamps
    end
  end
end
