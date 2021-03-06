class Category < ApplicationRecord
  has_and_belongs_to_many :spendings
  belongs_to :user

  validates :name, presence: true
end
