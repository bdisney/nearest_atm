FactoryBot.define do
  factory :atm do
    address 'Some address'

    factory :atm_with_location do
      after(:create) do |atm|
        create(:location, atm: atm)
      end
    end
  end
end
