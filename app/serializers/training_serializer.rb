class TrainingSerializer < ActiveModel::Serializer
  attributes :id, :training_title, :training_type
  has_one :category
end
