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
puts "Users created"

ACTIVITIES = [{
    title: "Go for a run",
    category: "Outdoor sports",
    description: "On the definitive list of amazing exercise activities,
     it’s an effective way to keep both your body and brain in great shape.
     Just lace up your running shoes and you’re ready to pound the pavement — or the treadmill, the track, the park, or the trail behind your house. 
     The options are endless. And you don’t have to carve out precious alone time to run, either. ",
    zone: "Núñez",
    photo: "https://images.unsplash.com/photo-1602619075660-d0f5459cb189?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80"
    }, {
    title: "BA Art exposition",
    category: "Cultural activities",
    description: "Buenos Aires has a lot more to offer if you’re willing to dig around a bit. 
    For those who enjoy art, or simply just want to get out the house and do something different, there are a lots of exhibitions hosted 
    by some of the trendiest and most alternative galleries in Buenos Aires.",
    zone: "Palermo",
    photo: "http://the-creative-business.com/wp-content/uploads/2014/06/512px-Robert_Mapplethorpe_Exhibition.jpg"
  }, {
    title: "Pizza tour",
    category: "Food and drinks",
    description: "Why pizza in Buenos Aires? Let’s go back to the roots of Buenos Aires. 
    Between 1857 and 1940 more than 3 million Italians immigrated to Buenos Aires. 
    That’s why Italian food is well integrated into the lifestyle of Buenos Aires. Pasta, strong coffee,
     and pizza!.",
    zone: "Flores",
    photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUfewwQbnqXV7PqOqlN9Vlbo-2Og-D_fsHvw&usqp=CAU"
  }, {
  title: "Football 5",
  category: "Outdoor sports",
  description: "Meet some people to play ball with!",
  zone: "Paternal",
  photo: "https://images.unsplash.com/photo-1544698310-74ea9d1c8258?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8c29jY2VyfGVufDB8MHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
}, {
  title: "Concert",
  category: "Cultural activities",
  description: "Buenos Aires is regarded by Argentinians as “the city that never sleeps,” and from a musical standpoint, they have a valid point. You can catch live music across the city from Monday to Sunday, with styles ranging from urban to electronic, rock to reggae, and classical to hip-hop.",
  zone: "Caballito",
  photo: "data:image/jpeg;base64,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"
}, {
  title: "Small beer places",
  category: "Food and drinks",
  description: "From Palermo to San Telmo to Retiro and beyond, the city is full of top-quality watering holes.",
  zone: "Palermo",
  photo: "https://images.unsplash.com/photo-1565539383096-875303015bd2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjk2fHxmcmllbmRzJTIwYW5kJTIwYmVlcnxlbnwwfDB8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
}, {
  title: "Vintage marketplaces",
  category: "Indoor activities",
  description: "Traditional market from Buenos Aires, with different gastronomic options",
  zone: "San Telmo",
  photo: "https://bymsolishostcollections.com/wp-content/uploads/2018/01/SJLUYda7z_930x525__1.jpg"
}, {
  title: "Parks and gardens",
  category: "Outdoor activities",
  description: "Japanese gardens are traditional gardens whose designs are accompanied by 
  Japanese aesthetics and philosophical ideas, avoid artificial ornamentation,
   and highlight the natural landscape.",
  zone: "Palermo",
  photo: "https://turismo.buenosaires.gob.ar/sites/turismo/files/jarin_japones_panoramica1200.jpg"
}, {
  title: "Urban Cicling",
  category: "Outdoor sports",
  description: "More and more people are challenging the car-dominated culture of our cities. And why not? Urban cycling is fun, healthy and lets you see your town in a new and interesting way. A bike can get you to the grocery store, concerts, to school or work—you name it. ",
  zone: "Recoleta",
  photo: "https://images.unsplash.com/photo-1587829723005-8c65e895fa12?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80"
} ,{
  title: "Picnic at the park",
  category: "Food and drinks",
  description: "Picnic definition is - an excursion or outing with food usually provided by members of the group and eaten in the open; also : the food provided for a picnic. ",
  zone: "Saavedra",
  photo: "https://images.unsplash.com/photo-1455734729978-db1ae4f687fc?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjQxfHxwaWNuaWN8ZW58MHwwfDB8&auto=format&fit=crop&w=500&q=60"
}, {
  title: "Skateboarding",
  category: "Outdoor sports",
  description: "Skateboarding is an action sport that involves riding and performing tricks using a skateboard, as well as a recreational activity, an art form, an entertainment industry job, and a method of transportation.",
  zone: "Caballito",
  photo: "https://images.unsplash.com/photo-1520045892732-304bc3ac5d8e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8&auto=format&fit=crop&w=500&q=60"
}, {
  title: "Go Sailing",
  category: "Outdoor activities",
  description: "Sailing is a sport fueled by the wind and the passion of the sailors who take the helm.Whether you’re interested in day sailing, cruising, competitive racing, or charter vacations, there is a sailboat for you and a lifetime of sailing adventures ahead.",
  zone: "Puerto Madero",
  photo: "https://images.unsplash.com/photo-1572160284221-09b54258561f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzl8fHNhaWwlMjBib2F0JTIwY2l0eXxlbnwwfDB8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
}, {
  title: "Kitesurf",
  category: "Outdoor sports",
  description: "Argentina might not be on the most popular kiteboarding destinations list, but it definitely has some good spots and ... If you're not sure where to go, you can go on organized kite tours where they take you around the ... Capital: Buenos Aires.",
  zone: "Nuñez",
  photo: "https://media.lacapital.com.ar/p/ba1978e4fdc824b88884b4be3308a2af/adjuntos/203/imagenes/029/427/0029427312/una-playa-llena-personas-haciendo-kitesurf-deporte-patentado-1977-gijsbertus-adrianus-panhuise.jpg"
}, {
  title: "Paintball",
  category: "Outdoor sports",
  description: "Discover the Museo de Arte Latinoamericano de Buenos Aires (MALBA)",
  zone: "Parque Patricios",
  photo: "https://images.unsplash.com/photo-1595239094941-3fca37f737a7?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NzF8fHBhaW50YmFsbHxlbnwwfDB8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
}, {
  title: "Board games",
  category: "Indoor activity",
  description: "You have allways some board game fanatic like your self, there are lots of places you can go",
  zone: "Microcentro",
  photo:"https://images.unsplash.com/photo-1532457573542-37fe94c98cf2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cGxheWluZyUyMGJvYXJkJTIwZ2FtZXN8ZW58MHwwfDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
}, {
  title: "Inline skating",
  category: "Outdoor sports",
  description: "Uses similar balance points, engages many of the same muscle groups from skiing, and many moves use the same body position. Over the past 10 years it has become more of a thing, and if there’s a good bike path I’ll blade for fun.",
  zone: "Devoto",
  photo: "https://media.istockphoto.com/photos/rollerblading-on-asphalt-road-picture-id599489564?k=6&m=599489564&s=612x612&w=0&h=XhAN3YF53dbIEwhdnR1fKX4VijUYN0iLcT7dlntb9CE="
  }, {
  title: "Ping-pong and beer",
  category: "Food and drinks",
  description: "There ara some awsome places, vibrant and full of young people having fun, playing ping pong, pool or table football. With super low-key that brings you back to the pre-smart phone Flappy bird days. it's a great atmosphere to grab some beers with friends and start a game of foosball. ",
  zone: "Villa Crespo",
  photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuvpUKD1LIsXDYem_sLYz_ZycWvYzPnJJwGg&usqp=CAU"
  }, {
  title: "Visit to historic an iconic places",
  category: "Cultural activities",
  description: "Buenos Aires is Argentina’s big, cosmopolitan capital city. Its center is the Plaza de Mayo, lined with stately 19th-century buildings including Casa Rosada, the iconic, balconied presidential palace. Other major attractions include Teatro Colón, a grand 1908 opera house with nearly 2,500 seats, and the modern MALBA museum, displaying Latin American art.",
  zone: "Monserrat",
  photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAjIXx9czfJTaCMGcV9KaaHOggeReja75yqA&usqp=CAU"
  }, {
  title: "Theater",
  category: "Cultural activities",
  description: "The great thing about Buenos Aires is that there is an almost ridiculous number of theaters of every imaginable size, putting on every conceivable type of show, from the huge musical productions, to independent comedies, dramas, and other alternative shows in more modest locations",
  zone: "Villa Crespo",
  photo: "http://thebubble.com/wp-content/uploads/2018/01/savia-play-buenos-aires.jpg"
  }, {
  title: "Escape room",
  category: "Indoor Activities",
  description: "A lot of fantastic and new art exhibitions",
  zone: "Palermo",
  photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-1e2CCEXKmh817j_bmakhNoKD5ojAzdZFUQ&usqp=CAU"
  }
]


ACTIVITIES.each do |activity|
  Activity.create!(activity)
end
puts "Activities created"

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
puts "Chatrooms created"

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
puts "Events created"

puts "Done:)"
