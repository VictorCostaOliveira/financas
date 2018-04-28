class User < ApplicationRecord
  has_many :spendings
  has_many :earnings
  has_many :goals

  validates :name, :password, presence: true
  validates :email, uniqueness: true, presence: true
end
