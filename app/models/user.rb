class User < ApplicationRecord
  has_many :events, foreign_key: 'host_id'
  has_many :itineraries, foreign_key: 'organizer_id'
  has_many :reservations, foreign_key: 'attendee_id'
  has_many :transactions, foreign_key: 'attendee_id'
  has_many :events, through: :reservation
end
