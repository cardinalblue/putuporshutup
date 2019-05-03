users = [
  { name: 'Grace', account: 'grace@hack', email: 'grace@hack', password:'123456', payment_account: 'grace' },
  { name: 'Jenny', account: 'jenny@hack', email: 'jenny@hack', password:'123456', payment_account: 'jenny' },
  # { name: 'Amelia', account: 'amelia@hack', password:'123456', payment_account: 'amelia' },
  # { name: 'Minnie', account: 'minnie@hack', password:'123456', payment_account: 'minnie' },
  # { name: 'Random', account: 'random@hack', password:'123456', payment_account: 'random' },
  # { name: 'Russell', account: 'russell@hack', password:'123456', payment_account: 'russell' }
]

# Create users
users.each do |u|
  User.create(u)
end

# Create itineraries
1.upto(3).each do |num|
  Itinerary.create(title: "hacking ##{num}", organizer_id: num % 2 + 1)

  1.upto(5).each do |i|
    Event.create(title: "fun stuff ##{i}",
                 description: 'you do not want to miss it',
                 map_url: 'https://maps.google.com',
                 price_per_person: '1',
                 refundable: false,
                 start_time: Time.now - 1.day,
                 end_time: Time.now + 1.day,
                 deadline: Time.now,
                 host_id: i,
                 itinerary_id: num)
  end
end

# Create reservations
1.upto(20).each do |i|
  Reservation.create(event_id: i % 3 + 1,
                     attendee_id: i % 2 + 1,
                     status: i % 3)
end