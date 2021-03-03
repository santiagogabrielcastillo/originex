puts "Cleaning database"
Event.destroy_all
Participant.destroy_all
Chatroom.destroy_all
UserInterest.destroy_all
Activity.destroy_all
User.destroy_all

USERS = [{
  email: "something1@gmail.com",
  password: "123123",
  username: "Pato",
  full_name: "Roberto Bonano",
  phone_number: "123789456",
  birthday: Date.new(1984-6-9),
  address: "Av. Cabildo 1298, Buenos Aires, Argentina"
}, {
  email: "something2@gmail.com",
  password: "123123",
  username: "Chiquito",
  full_name: "Martin Quesada",
  phone_number: "987654321",
  birthday: Date.new(1990-1-9),
  address: "Av. Santa Fe 1298, Buenos Aires, Argentina"
}, {
  email: "something3@gmail.com",
  password: "123123",
  username: "Genio",
  full_name: "Santi Pastrano",
  phone_number: "987456123",
  birthday: Date.new(1976-5-7),
  address: "Paraguay 1450, Buenos Aires, Argentina"
}]

USERS.each do |user|
  User.create!(user)
end

ACTIVITIES = [{
    title: "Go for a run",
    category: "Outdoor sports",
    description: "Enjoy the nature while running among friends!",
    address: "Infanta Isabel 410, Buenos Aires, Argentina"
  }, {
    title: "Art's museum",
    category: "Cultural activities",
    description: "Discover the Museo de Arte Latinoamericano de Buenos Aires",
    address: "Figueroa Alcorta 3415, Buenos Aires, Argentina"
  }, {
    title: "Eat a pizza",
    category: "Food and drinks",
    description: "Have a pizza in an iconic place of Buenos Aires, Pizzería Guerrín",
    address: "Av. Corrientes 1368, Buenos Aires, Argentina"
  }
]

ACTIVITIES.each do |activity|
  Activity.create!(activity)
end

users = User.all
activities = Activity.all
users.each do |user|
  activities.each do |activity|
    UserInterest.create!(user: user, activity: activity)
  end
end

CHATROOMS = [{
    title: "Futbol 5 - Belgrano",
    description: "Vamos a jugar un picadito los sabado.",
    activity_id: Activity.first.id
  }, {
    title: "Corriendo por un sueño",
    description: "Vamos a sudar para ayudar!",
    activity_id: Activity.first.id
  }, {
    title: "Asados populares",
    description: "Democratizando el arte de la parrilla",
    activity_id: Activity.second.id
  }, {
    title: "Cocina para todos!",
    description: "Somos personas que amamos cocinar.",
    activity_id: Activity.second.id
  }, {
    title: "Aprendiendo con Felipe",
    description: "Enseñamos a codear",
    activity_id: Activity.last.id
  }, {
    title: "Educando ando",
    description: "Vamos a una escuela a jugar y ensenarles a leer a chicos humildes de primaria.",
    activity_id: Activity.last.id
  }
]
  
CHATROOMS.each do |chatroom|
  Chatroom.create!(chatroom)
end

chatrooms = Chatroom.all
users.each do |user|
  chatrooms.each do |chatroom|
    Participant.create!(user: user, chatroom: chatroom)
  end
end

EVENTS = [{
  status: "public",
  details: "19hs en Tiro Federal.",
  date: DateTime.new(2021,9,1,19),
  activity_id: Activity.first.id,
  chatroom_id: Chatroom.first.id
}, {
  status: "private",
  details: "20hs en Plaza Las Heras .",
  date: DateTime.new(2021,12,1,20),
  activity_id: Activity.first.id,
  chatroom_id: Chatroom.second.id
}, {
  status: "public",
  details: "Asados a las 14.",
  date: DateTime.new(2021,7,15,14),
  activity_id: Activity.second.id,
  chatroom_id: Chatroom.third.id
}, {
  status: "private",
  details: "Nos juntamos los miercoles al Mediodia a cocinar para alimentar un comedor.",
  date: DateTime.new(2021,11,20,13),
  activity_id: Activity.second.id,
  chatroom_id: Chatroom.fourth.id
}, {
  status: "public",
  details: "Viernes a las 17hs",
  date: DateTime.new(2021,2,26,17),
  activity_id: Activity.last.id,
  chatroom_id: Chatroom.fifth.id
}, {
  status: "public",
  details: "Domingos de 15hs a 20hs.",
  date: DateTime.new(2021,4,13,16),
  activity_id: Activity.last.id,
  chatroom_id: Chatroom.last.id
}
]

EVENTS.each do |event|
  Event.create!(event)
end

puts "3 users, 3 activities, 6 chatrooms and 6 events created"
