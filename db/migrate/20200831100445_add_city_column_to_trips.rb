class AddCityColumnToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :city, :string
  end
end
