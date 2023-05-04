# frozen_string_literal: true

class Training < ApplicationRecord
  belongs_to :category

  validates :training_title, presence: true
end
