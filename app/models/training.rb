# frozen_string_literal: true

class Training < ApplicationRecord
  belongs_to :category

  validates :training_title, presence: true

  class Training < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      ['category_id', 'created_at', 'id', 'training_title', 'training_type', 'updated_at']
    end
  
  end
end
