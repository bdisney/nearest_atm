class Location < ApplicationRecord
  belongs_to :atm

  validates :latitude, :longitude, presence: true
end
