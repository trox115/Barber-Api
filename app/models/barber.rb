class Barber < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates_presence_of :name
  validates_presence_of :short_description
  validates :facebook, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  validates :twitter, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  validates :instagram, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  validates :color, format: { with: /\A#(?:\h{3}){1,2}\z/ }
  validates :description, length: { minimum: 60 }
  validates :short_description, length: { maximum: 60 }
end
