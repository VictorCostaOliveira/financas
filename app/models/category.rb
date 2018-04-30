class Category < ApplicationRecord
  has_and_belongs_to_many :spendings
  validates :name, presence: true
end
