class Spending < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :value, presence: true
end
