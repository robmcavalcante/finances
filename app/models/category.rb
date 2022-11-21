class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :icon, presence: true, length: { maximum: 75 }
  validates :color, presence: true, length: { maximum: 20 }
end
