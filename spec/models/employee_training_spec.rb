# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeTraining, type: :model do
  it { is_expected.to(validate_presence_of(:season)) }
  it { is_expected.to(belong_to(:employee)) }
  it { is_expected.to(belong_to(:training)) }
end
