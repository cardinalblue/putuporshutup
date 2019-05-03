class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: 'host_id'
  has_many :itineraries, foreign_key: 'organizer_id'
  has_many :reservations, foreign_key: 'attendee_id'
  has_many :transactions, foreign_key: 'attendee_id'
  has_many :events, through: :reservation
end
