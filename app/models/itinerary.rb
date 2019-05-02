class Itinerary < ApplicationRecord
  has_many :events
  belongs_to :organizer, class_name: 'User'
end
