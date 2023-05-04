# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :full_name, null: false
      t.string :email, null: false, unique: true
      t.string :department, null: false
      t.string :location, null: false

      t.timestamps
    end
  end
end
