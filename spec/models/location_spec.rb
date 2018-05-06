require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should belong_to(:atm) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
end
