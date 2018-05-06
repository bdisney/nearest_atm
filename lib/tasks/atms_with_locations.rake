namespace :atms_with_locations do
  task seed: :environment do
    n = 1000
    n.times do
      atm = Atm.create
      atm.create_location(latitude: rand(-90.0...90.0), longitude: rand(-180.0...180.0))
    end
  end
end
