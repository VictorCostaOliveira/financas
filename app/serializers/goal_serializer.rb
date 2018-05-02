class GoalSerializer < ActiveModel::Serializer
  attributes :id, :description, :end_date, :value, :parcel
end
