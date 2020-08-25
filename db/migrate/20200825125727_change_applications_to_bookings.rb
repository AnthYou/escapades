class ChangeApplicationsToBookings < ActiveRecord::Migration[6.0]
  def change
    rename_table :applications, :bookings
  end
end
