class TrainingSerializer < ActiveModel::Serializer
  attributes :id, :training_title, :training_type, :parent_category, :category_id
end
