# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.where(id: 1, name: 'Certification', ancestry: nil).first_or_create
Category.where(id: 2, name: 'HRD', ancestry: nil).first_or_create
Category.where(id: 3, name: 'Virtual', ancestry: nil).first_or_create
Category.where(id: 11, name: 'Management Risk', ancestry: 1).first_or_create
Category.where(id: 12, name: 'Management Internal Audit', ancestry: 1).first_or_create
Category.where(id: 13, name: 'Management PPM', ancestry: 1).first_or_create
Category.where(id: 14, name: 'IT Security', ancestry: 1).first_or_create
Category.where(id: 15, name: 'IT Infrastructure', ancestry: 1).first_or_create
Category.where(id: 16, name: 'IT Oracle', ancestry: 1).first_or_create
Category.where(id: 17, name: 'IT Programming', ancestry: 1).first_or_create
Category.where(id: 18, name: 'IT Enterprise Architecture', ancestry: 1).first_or_create
Category.where(id: 19, name: 'Engineering and Construction', ancestry: 1).first_or_create
Category.where(id: 110, name: 'Others', ancestry: 1).first_or_create
Category.where(id: 21, name: 'Management and Leadership', ancestry: 2).first_or_create
Category.where(id: 22, name: 'Marketing and Sales', ancestry: 2).first_or_create
Category.where(id: 23, name: 'Services', ancestry: 2).first_or_create
Category.where(id: 24, name: 'IT', ancestry: 2).first_or_create
Category.where(id: 25, name: 'Others', ancestry: 2).first_or_create
Category.where(id: 31, name: 'Virtual Trainings', ancestry: 3).first_or_create
Category.where(id: 32, name: 'Others', ancestry: 3).first_or_create