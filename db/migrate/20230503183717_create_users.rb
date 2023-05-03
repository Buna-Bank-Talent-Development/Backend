class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :department
      t.string :place_of_work

      t.timestamps
    end
  end
end
