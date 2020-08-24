class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.string :destination
      t.integer :budget_min
      t.integer :budget_max
      t.date :departure_date
      t.date :return_date
      t.integer :max_capacity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
