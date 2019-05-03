users = [
  { name: 'Grace', account: 'grace@hack', payment_account: 'grace' },
  { name: 'Jenny', account: 'jenny@hack', payment_account: 'jenny' },
  { name: 'Amelia', account: 'amelia@hack', payment_account: 'amelia' },
  { name: 'Minnie', account: 'minnie@hack', payment_account: 'minnie' },
  { name: 'Random', account: 'random@hack', payment_account: 'random' },
  { name: 'Russell', account: 'russell@hack', payment_account: 'russell' }
]

# Create users
users.each do |u|
  User.create(u)
end

# Create itineraries
1.upto(6).each do |num|
  Itinerary.create(title: "hacking ##{num}", organizer_id: num)

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
  Reservation.create(event_id: i % 5 + 1,
                     attendee_id: i % 6 + 1,
                     status: i % 3)
end