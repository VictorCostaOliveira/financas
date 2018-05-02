class SpendingSerializer < ActiveModel::Serializer

  attributes :description, :value, :categories
  has_many :categories
  def categories
    object.categories
  end
end
