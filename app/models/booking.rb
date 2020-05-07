class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :barber
  validates_presence_of :book_time
  validates :book_time, date: true
end
