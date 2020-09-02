class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :content
      t.references :booking, null: false, foreign_key: true
      t.boolean :read
      t.references :receiver, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
