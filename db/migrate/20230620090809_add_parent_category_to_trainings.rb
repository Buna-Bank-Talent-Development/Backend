class AddParentCategoryToTrainings < ActiveRecord::Migration[7.0]
  def change
    add_column :trainings, :parent_category, :string
  end
end
