class Atm < ApplicationRecord
  has_one :location, dependent: :destroy

  validates_associated :location
end
