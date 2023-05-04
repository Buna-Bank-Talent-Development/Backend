# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employee, type: :model do
  it { is_expected.to(validate_presence_of(:full_name)) }
  it { is_expected.to(validate_presence_of(:email)) }
  it { is_expected.to(validate_presence_of(:department)) }
  it { is_expected.to(validate_presence_of(:location)) }
end
