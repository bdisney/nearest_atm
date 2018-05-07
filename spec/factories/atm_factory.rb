FactoryBot.define do
  factory :atm do
    address 'Some address'

    before(:create) do |atm|
      build(:location, atm: atm)
    end
  end
end
