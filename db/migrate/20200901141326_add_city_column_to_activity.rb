class AddCityColumnToActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :city, :string
  end
end
