class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.string :training_title, null: false
      t.string :training_type
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
