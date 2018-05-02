class User < ApplicationRecord
  has_many :spendings
  has_many :earnings
  has_many :goals
  has_many :categories

  validates :email, :name, :password, presence: true
  validates :email, uniqueness: true
end
