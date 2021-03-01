puts "Cleaning database"
Activity.destroy_all
Chatroom.destroy_all
Event.destroy_all

ACTIVITIES = [{
    title: "Go for a run",
    category: "Outdoor sports",
    description: "Enjoy the nature while running among friends!",
    address: "Infanta Isabel 410, Buenos Aires, Argentina"
  }, {
    title: "Go to the Art's museum",
    category: "Cultural activities",
    description: "Discover the Museo de Arte Latinoamericano de Buenos Aires (MALBA)",
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

CHATROOMS = [{
    title: "Futbol 5 - Belgrano",
    description: "Vamos a jugar un picadito los sabado.",
    activities_id: Activity.first.id
  }, {
    title: "Cocina para todos!",
    description: "Somos personas que amamos cocinar.",
    activities_id: Activity.second.id
  }, {
    title: "Educando ando",
    description: "Vamos a una escuela a jugar y ensenarles a leer a chicos humildes de primaria.",
    activities_id: Activity.last.id
  }
]
  
CHATROOMS.each do |chatroom|
  Chatroom.create!(chatroom)
end

EVENTS = [{
  status: "public",
  details: "19hs en Tiro Federal.",
  date: DateTime.new(2021,9,1,19),
  activities_id: Activity.first.id,
  chatrooms_id: Chatroom.first.id
}, {
  status: "private",
  details: "Nos juntamos los miercoles al Mediodia a cocinar para alimentar un comedor.",
  date: DateTime.new(2021,11,20,13),
  activities_id: Activity.second.id,
  chatrooms_id: Chatroom.second.id
}, {
  status: "public",
  details: "Domingos de 15hs a 20hs.",
  date: DateTime.new(2021,4,13,16),
  activities_id: Activity.last.id,
  chatrooms_id: Chatroom.last.id
}
]

EVENTS.each do |event|
  Event.create!(event)
end

puts "3 activities, chatrooms and events created"
