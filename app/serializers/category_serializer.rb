class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :ancestry
end
