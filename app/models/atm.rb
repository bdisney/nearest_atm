class Atm < ApplicationRecord
  has_one :location, dependent: :destroy

  validates_associated :location

  DISTANCE_THRESHOLD = 25000.freeze

  def self.nearest(lat, long, distance_threshold = DISTANCE_THRESHOLD)
    Rails.cache.fetch([self.class.name, lat, long], expires_in: 1.hour) {
      Location.find_by_sql("
        SELECT * FROM (SELECT *, ( 6371 * acos( cos( radians(#{lat}) ) * cos( radians( latitude ) )
        * cos( radians( longitude ) - radians(#{long}) )
        + sin( radians(#{lat}) ) * sin ( radians ( latitude ) ) ) ) AS distance
        FROM locations
        LEFT OUTER JOIN atms on locations.atm_id = atms.id) as qq
        WHERE distance < #{distance_threshold}
        ORDER BY distance
        LIMIT 5;
      ")
    }
  end
end
