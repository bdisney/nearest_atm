class Atm < ApplicationRecord
  has_one :location, dependent: :destroy
end
