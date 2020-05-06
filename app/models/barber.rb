class Barber < ApplicationRecord
  has_many :bookings, dependent: :destroy

end
