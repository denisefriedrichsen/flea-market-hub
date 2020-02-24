class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :spot, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status
      t.date :date

      t.timestamps
    end
  end
end
