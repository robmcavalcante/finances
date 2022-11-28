class Transaction < ApplicationRecord
  belongs_to :invoice
  belongs_to :card
  belongs_to :category
  has_many :items

  accepts_nested_attributes_for :items

end
