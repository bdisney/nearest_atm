class AtmFilter
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :latitude, :longitude

  validates :latitude,  numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 },
            allow_blank: true
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 },
            allow_blank: true

  def perform
    return unless latitude.present? && longitude.present?
    Atm.nearest(latitude, longitude)
  end
end
