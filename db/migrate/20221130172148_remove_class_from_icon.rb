class RemoveClassFromIcon < ActiveRecord::Migration[7.0]
  def change
    remove_column :icons, :class, :string
  end
end
