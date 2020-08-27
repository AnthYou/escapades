class AddDateToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :start_date, :date
    add_column :activities, :end_date, :date
  end
end
