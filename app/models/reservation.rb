class Reservation < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: 'User'

  enum status: [:pending, :paid, :rejected, :refunded]
end
