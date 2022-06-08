class MealSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price
end
