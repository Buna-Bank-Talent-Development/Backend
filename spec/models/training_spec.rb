require 'rails_helper'

RSpec.describe Training, type: :model do

  it{is_expected.to(belong_to(:category))}
  it{is_expected.to(validate_presence_of(:training_title))}

end
