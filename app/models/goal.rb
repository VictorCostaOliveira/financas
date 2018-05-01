class Goal < ApplicationRecord
  belongs_to :user

  validates :parcel, :value, presence: true
end
