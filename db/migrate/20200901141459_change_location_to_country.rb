class ChangeLocationToCountry < ActiveRecord::Migration[6.0]
  def change
    rename_column :activities, :location, :country
  end
end
