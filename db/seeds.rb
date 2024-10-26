[
  Subscription,
  Event,
  User
].each(&:delete_all)

password = 'password1234'

user_1 = User.create!(email: 'user1@email.com', password: password, password_confirmation: password)
user_2 = User.create!(email: 'user2@email.com', password: password, password_confirmation: password)

event_1 = Event.create!(
  user: user_1,
  name: 'Django introduction',
  schedule: 2.week.from_now,
  location: '24 main street, NY'
)

Subscription.create!(
  user: user_2,
  event: event_1
)

event_2 = Event.create!(
  user: user_2,
  name: 'RubyOnRails introduction',
  schedule: 1.week.from_now,
  location: '22 main street, NY'
)

Subscription.create!(
  user: user_1,
  event: event_2
)