class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :department, :location
end
