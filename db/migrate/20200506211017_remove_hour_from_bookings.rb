class RemoveHourFromBookings < ActiveRecord::Migration[6.0]
  def change

    remove_column :bookings, :hour, :integer

    remove_column :bookings, :date, :string
  end
end
