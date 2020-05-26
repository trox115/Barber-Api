class AddBookTimeToBookings < ActiveRecord::Migration[6.0]
  def change
  	add_column :bookings, :book_time, :datetime
  end
end
