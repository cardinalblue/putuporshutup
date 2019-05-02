class Event < ApplicationRecord
  has_many :reservations
  has_many :attendees, class_name: 'User', through: :reservations
  has_many :transactions
  belongs_to :itinerary
  belongs_to :host, class_name: 'User'
end
