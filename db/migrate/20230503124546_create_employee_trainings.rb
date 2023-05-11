# frozen_string_literal: true

class CreateEmployeeTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_trainings do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :training, null: false, foreign_key: true
      t.string :season, null: false

      t.timestamps
    end
  end
end
