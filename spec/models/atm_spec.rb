require 'rails_helper'

RSpec.describe Atm, type: :model do
  it { should have_one(:location) }

  it 'should validate associated location' do
    atm = Atm.new
    atm.build_location
    expect(atm.save).to be_falsey
  end
end
