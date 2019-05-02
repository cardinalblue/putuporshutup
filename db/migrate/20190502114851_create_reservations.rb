class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :event
      t.references :attendee
      t.integer :status

      t.timestamps
    end
  end
end
