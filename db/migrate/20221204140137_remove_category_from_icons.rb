class RemoveCategoryFromIcons < ActiveRecord::Migration[7.0]
  def change
    remove_reference :icons, :category, null: false, foreign_key: true
  end
end
