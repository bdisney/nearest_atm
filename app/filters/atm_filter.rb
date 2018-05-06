class AtmFilter
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :latitude, :longitude

  validates :latitude,  numericality: { greater_than_or_equal_to:  -90, less_than_or_equal_to:  90 }
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

  def initialize(params = {})
    @latitude  = params['latitude']
    @longitude = params['longitude']
  end

  def perform
    return unless latitude.present? && longitude.present?
    @query = Atm.nearest(latitude, longitude)
  end
end
