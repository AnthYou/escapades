class ChangeDestinationToCountry < ActiveRecord::Migration[6.0]
  def change
    rename_column :trips, :destination, :country
  end
end
