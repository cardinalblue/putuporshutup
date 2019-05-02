class AddItineraryReferenceToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :itinerary
  end
end
