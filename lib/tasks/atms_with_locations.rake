namespace :atms_with_locations do
  task seed: :environment do
    n = 1000
    n.times do
      atm = Atm.new
      atm.build_location(latitude: rand(-90.0...90.0), longitude: rand(-180.0...180.0))
      atm.save
    end
  end
end
