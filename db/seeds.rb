puts "Cleaning database"
Event.destroy_all
Participant.destroy_all
Message.destroy_all
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
    description: "On the definitive list of amazing exercise activities,
     running ranks pretty highly — the practical benefits include convenience and affordability, 
     but from a health standpoint, it’s an effective way to keep both your body and brain in great shape.Just lace up your running shoes and you’re ready to pound the pavement — or the treadmill, the track, the park, or the trail behind your house. 
     The options are endless. And you don’t have to carve out precious alone time to run, either. ",
    zone: "Palermo",
    photo:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-1e2CCEXKmh817j_bmakhNoKD5ojAzdZFUQ&usqp=CAU"
  }, {
    title: "Go to an art exposition",
    category: "Cultural activities",
    description: "Discover the Museo de Arte Latinoamericano de Buenos Aires (MALBA)",
    zone: "Palermo",
    photo:
  }, {
    title: "pizza",
    category: "Food and drinks",
    description: "Have a pizza in an iconic place of Buenos Aires, Pizzería Guerrín",
    zone: "Microcentro",
    photo:
  }, {
  title: "Football",
  category: "Outdoor sports",
  description: "Meet some people to play ball with!",
  zone: "Devoto",
  photo:
}, {
  title: "Go to a concert",
  category: "Cultural activities",
  description: "check in",
  zone: "Belgrano",
  photo:
}, {
  title: "beer tour",
  category: "Food and drinks",
  description: "Have a pizza in an iconic place of Buenos Aires, Pizzería Guerrín",
  zone: "Microcentro",
  photo:
}, {
  title: "Mercado San Nicolás",
  category: "Food and drinks",
  description: "Traditional market from Buenos Aires, with different gastronomic options",
  zone: "Centro",
  photo:
}, {
  title: "Jardín Japonés",
  category: "Outdoor activities",
  description: "Beautiful park with a lot of japanese culture",
  zone: "Palermo",
  photo:
}, {
  title: "cicling",
  category: "Cultural activities",
  description: "A lot of fantastic and new art exhibitions",
  zone: "Palermo",
  photo:
} ,{
  title: "Picnic at the park",
  category: "Food and drinks",
  description: "Let's eat in an iconic place of Buenos Aires, while enjoying the sunset",
  zone: "Palermo",
  photo:
}, {
  title: "Go skateboarding",
  category: "Outdoor sports",
  description: "Enjoy this amazing sport with friends!",
  zone: "Caballito",
  photo:
}, {
  title: "",
  category: "Outdoor activities",
  description: "Walk by the Rio de La Plata river",
  zone: "Puerto Madero",
  photo:
}, {
  title: "kitesurf",
  category: "Outdoor sports",
  description: "Enjoy this beautiful sport while enjoying the landscape",
  zone: "Palermo",
  photo:
}, {
  title: "sailing",
  category: "Outdoor sports",
  description: "Enjoy the nature while running among friends!",
  zone: "Palermo",
  photo:
}, {
  title: "paintball",
  category: "Cultural activities",
  description: "Discover the Museo de Arte Latinoamericano de Buenos Aires (MALBA)",
  zone: "Palermo",
  photo:
}, {
  title: "board games",
  category: "Food and drinks",
  description: "Have a pizza in an iconic place of Buenos Aires, Pizzería Guerrín",
  zone: "Microcentro",
  photo:
}, {
title: "",
category: "Outdoor sports",
description: "Meet some people to play ball with!",
zone: "Devoto",
photo:
}, {
title: "ping-pon and beer",
category: "Food and drinks",
description: "",
zone: "Belgrano",
photo:
}, {
title: "Visit to historic an iconic places",
category: "Food and drinks",
description: "Have a pizza in an iconic place of Buenos Aires, Pizzería Guerrín",
zone: "Microcentro",
photo:
}, {
title: "Theater",
category: "Cultural activities",
description: "Traditional market from Buenos Aires, with different gastronomic options",
zone: "Centro",
photo:
}, {
title: "kayaking",
category: "Outdoor sports",
description: "Beautiful park with a lot of japanese culture",
zone: "Palermo",
photo:
}, {
title: "escape room",
category: "Cultural activities",
description: "A lot of fantastic and new art exhibitions",
zone: "Palermo",
photo:
} ,{
title: "Go climbing",
category: "Outdoor sports",
description: "",
zone: "Palermo",
photo:
}, {
title: "Go skateboarding",
category: "",
description: "",
zone: "Caballito",
photo:
}, {
title: "",
category: "",
description: "",
zone: "",
photo:
}, {
title: "",
category: "",
description: "",
zone: "",
photo:
}
]

ACTIVITIES.each do |activity|
  Activity.create!(activity)
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

EVENTS = [{
  status: "public",
  details: "19hs en Tiro Federal.",
  date: DateTime.new(2021,9,1,19),
  activity_id: Activity.first.id,
  chatroom_id: Chatroom.first.id,
  address: "Av. del Libertador 6905, Buenos Aires, Argentina"
}, {
  status: "private",
  details: "20hs en Plaza Las Heras .",
  date: DateTime.new(2021,12,1,20),
  activity_id: Activity.first.id,
  chatroom_id: Chatroom.second.id,
  address: "Av. Gral. Las Heras 3353, Buenos Aires, Argentina"
}, {
  status: "public",
  details: "Asados a las 14.",
  date: DateTime.new(2021,7,15,14),
  activity_id: Activity.second.id,
  chatroom_id: Chatroom.third.id,
  address: "Av. Corrientes 1368, Buenos Aires, Argentina"
}, {
  status: "private",
  details: "Nos juntamos los miercoles al Mediodia a cocinar para alimentar un comedor.",
  date: DateTime.new(2021,11,20,13),
  activity_id: Activity.second.id,
  chatroom_id: Chatroom.fourth.id,
  address: "Av. Corrientes 1368, Buenos Aires, Argentina"
}, {
  status: "public",
  details: "Viernes a las 17hs",
  date: DateTime.new(2021,2,26,17),
  activity_id: Activity.last.id,
  chatroom_id: Chatroom.fifth.id,
  address: "Infanta Isabel 410, Buenos Aires, Argentina"
}, {
  status: "public",
  details: "Domingos de 15hs a 20hs.",
  date: DateTime.new(2021,4,13,16),
  activity_id: Activity.last.id,
  chatroom_id: Chatroom.last.id,
  address: "Infanta Isabel 410, Buenos Aires, Argentina"
}
]

EVENTS.each do |event|
  Event.create!(event)
end

puts "3 users, 2 activities, 6 chatrooms and 6 events created"
