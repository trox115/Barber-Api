FactoryBot.define do
  factory :random_booking, class: Booking do
    book_time { Faker::Date.in_date_period }
  end
end
