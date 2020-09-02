class SetTransportTypeDefaultToActivities < ActiveRecord::Migration[6.0]
  def change
    change_column_default :activities, :transport_type, from: nil, to: 'Plane'
  end
end
