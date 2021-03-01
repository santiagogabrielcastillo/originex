puts "Cleaning database"
Activity.destroy_all
Chatroom.destroy_all
Event.destroy_all

CHATROOMS = [{
    title: "Futbol 5 - Belgrano",
    description: "Vamos a jugar un picadito el sabado a las 19hs en Tiro Federal.",
    activities_id: Activity.first.id
  }, {
    title: "Cocina para todos!",
    description: "Somos personas que amamos cocinar y nos juntamos los miercoles al mediodia a cocinar para alimentar un comedor.",
    activities_id: Activity.second.id
  }, {
    title: "Educando ando",
    description: "Vamos los domingos a una escuela a jugar y ensenarles a leer a chicos humildes de primaria.",
    activities_id: Activity.last.id
  }
]
  
CHATROOMS.each do |chatroom|
  Chatroom.create!(chatroom)
end

EVENTS = [{
  status: "public",
  details: "Vamos a jugar un picadito el sabado a las 19hs en Tiro Federal.",
  date: DateTime.new(2021,9,1,19),
  activities_id: Activity.first.id,
  chatrooms_id: Chatroom.first.id
}, {
  status: "private",
  details: "Somos personas que amamos cocinar y nos juntamos los miercoles al mediodia a cocinar para alimentar un comedor.",
  date: DateTime.new(2021,11,20,13),
  activities_id: Activity.second.id,
  chatrooms_id: Chatroom.second.id
}, {
  status: "public",
  details: "Vamos los domingos a una escuela a jugar y ensenarles a leer a chicos humildes de primaria.",
  date: DateTime.new(2021,4,13,16),
  activities_id: Activity.last.id,
  chatrooms_id: Chatroom.last.id
}
]

EVENTS.each do |event|
  Event.create!(event)
end

puts "3 activities, chatrooms and events created"