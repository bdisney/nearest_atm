class Atm < ApplicationRecord
  has_one :location, dependent: :destroy

  validate :location_fields, if: :location_invalid?

  DISTANCE_THRESHOLD = 25000.freeze
  RESULT_LIMIT = 5.freeze

  def self.nearest(lat, long, distance_threshold = DISTANCE_THRESHOLD)
    Rails.cache.fetch([self.class.name, lat, long], expires_in: 1.hour) {
      find_by_sql("
        SELECT atms.*, locs.distance
        FROM (
          SELECT *, ( 6371 * acos( cos( radians(#{lat}) ) * cos( radians( latitude ) )
                           * cos( radians( longitude ) - radians(#{long}) )
                           + sin( radians(#{lat}) ) * sin ( radians ( latitude ) ) )
        ) AS distance FROM locations) as locs
        INNER JOIN atms on locs.atm_id = atms.id
        WHERE distance < #{distance_threshold}
        ORDER BY distance
        LIMIT #{RESULT_LIMIT};
      ")
    }
  end

  private

  def location_invalid?
    !location.valid?
  end

  def location_fields
    location.errors.messages.each do |field, msgs|
      errors.add(I18n.t("activerecord.attributes.location.#{field}"), msgs.join(', '))
    end
  end
end
