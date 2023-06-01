class TrainingSerializer < ActiveModel::Serializer
  attributes :id, :training_title, :training_type, :category_id
end
