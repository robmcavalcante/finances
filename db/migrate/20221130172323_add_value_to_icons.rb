class AddValueToIcons < ActiveRecord::Migration[7.0]
  def change
    add_column :icons, :value, :string, limit: 70
  end
end
