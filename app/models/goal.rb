class Goal < ApplicationRecord
  belongs_to :user

  validates :end_date, :parcel, :value, presence: true
end
