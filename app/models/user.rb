class User < ApplicationRecord
    has_one_time_password

    validates :name, :email, :department, :place_of_work, presence: true
    validates :email, uniqueness: true
end
