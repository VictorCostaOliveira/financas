class Category < ApplicationRecord
  has_and_belongs_to_many :spendings
  vallidates :name, presence: true
end
