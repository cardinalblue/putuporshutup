class CreateItineraries < ActiveRecord::Migration[5.1]
  def change
    create_table :itineraries do |t|
      t.string :title, null: false
      t.references :organizer

      t.timestamps
    end
  end
end
