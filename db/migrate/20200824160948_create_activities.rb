class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :location
      t.string :url
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
