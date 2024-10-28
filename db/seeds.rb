# Limpa todas a tabelas do banco de dados:
[
  Subscription,
  Event,
  User
].each(&:delete_all)

password = 'password1234'

# Cria dois usuários:
user_1 = User.create!(email: 'user1@email.com', password: password, password_confirmation: password)
user_2 = User.create!(email: 'user2@email.com', password: password, password_confirmation: password)

# Cria evento pro usuário 1
event_1 = Event.create!(
  user: user_1,
  name: 'Como programar com Python',
  schedule: 2.week.from_now,
  location: 'Av. Paulista, 300 - Bela Vista',
  description: 'Nesse evento vamos mostrar como programar usando a linguagem Python'
)

# Inscreve o usuário 2 no evento do usuário 1
Subscription.create!(
  user: user_2,
  event: event_1
)

# Cria evento pro usuário 2
event_2 = Event.create!(
  user: user_2,
  name: 'Como programar com Ruby',
  schedule: 1.week.from_now,
  location: 'Av. Paulista, 890 - Bela Vista',
  description: 'Nesse evento vamos mostrar como programar usando a linguagem Ruby'
)

# Inscreve o usuário 1 no evento do usuário 2
Subscription.create!(
  user: user_1,
  event: event_2
)