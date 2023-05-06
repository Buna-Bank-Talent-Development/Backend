class EmployeeTrainingSerializer < ActiveModel::Serializer
  attributes :id, :season
  has_one :employee
  has_one :training
end
