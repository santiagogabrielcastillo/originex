require 'open-uri'

puts "Cleaning database"
Event.destroy_all
Participant.destroy_all
Message.destroy_all
Chatroom.destroy_all
UserInterest.destroy_all
Activity.destroy_all
User.destroy_all

USERS = [{
  email: "santialmiron@gmail.com",
  password: "123123",
  username: "Cabezon",
  full_name: "Santiago Almiron",
  phone_number: "123789456",
  birthday: Date.new(1984-6-9),
  address: "Av. Cabildo 1298, Buenos Aires, Argentina",
  description: "I am from Junín, I was studying the second year of mechanics Ing when I realized that it was not my thing and I decided to go for the programming side and, occasionally, web development, so I am very happy to be able to participate in the Bootcamp.",
  photo: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1612288076/se0rvhfjaqithgqheaur.jpg")
  }, {
  email: "maxiamodei@gmail.com",
  password: "123123",
  username: "Cerebro",
  full_name: "Maximiliano Amodei",
  phone_number: "987654321",
  birthday: Date.new(1990-1-9),
  address: "Av. Santa Fe 1298, Buenos Aires, Argentina",
  description: "Before joining Le Wagon I studied economics and finance and started working in planning and accounting sectors for a company. Then, after discovering it was a boring job I wanted to make a career shift and decided to join the bootcamp",
  photo: URI.open("https://avatars.githubusercontent.com/u/70491418?v=4")
  }, {
  email: "santicastillo@gmail.com",
  password: "123123",
  username: "Genio",
  full_name: "Santiago Castillo",
  phone_number: "987456123",
  birthday: Date.new(1976-5-7),
  address: "Paraguay 1450, Buenos Aires, Argentina",
  description: "I'm 25 and from Argentina. I'm a chemical engineer but I want to make a radical change in my professional like, so I'm looking forward to learning web development and other new skills :)",
  photo: URI.open("https://avatars0.githubusercontent.com/u/71985198?v=4")
}, {
  email: "rayleon@gmail.com",
  password: "123123",
  username: "O Rei",
  full_name: "Rey de Leon",
  phone_number: "906256123",
  birthday: Date.new(1976-5-7),
  address: "Paraguay 750, Buenos Aires, Argentina",
  description: "Currently, i been working as Director of Finance and Operations for Media companies. I looking to learn code to either change my career or build my own Starup.",
  photo: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1612188000/slp2v362avwl3xtoqd1o.jpg")
}, {
  email: "gonzaenei@gmail.com",
  password: "123123",
  username: "Cebolla",
  full_name: "Gonzalo Enei",
  phone_number: "987450591",
  birthday: Date.new(1976-5-7),
  address: "Juncal 1899",
  description: "Interested in startups and how they grow. I currently work at Fintual, a wealth management startup for Latam. Excited to get coding knowledge to further improve my work as a PM.",
  photo: URI.open("https://avatars.githubusercontent.com/u/48967446?v=4")
}, {
  email: "natalygarcia@gmail.com",
  password: "123123",
  username: "Chocolate",
  full_name: "Nataly Garcia",
  phone_number: "847453423",
  birthday: Date.new(1976-5-7),
  address: "Av. Aurelio Miró Quesada 500, San Isidro, Peru",
  description: "Soy administradora de empresas, peruana y tengo 10 años de experiencia liderando equipos comerciales multidisciplinarios en Telecomunicaciones, Consumo Masivo y Banca y tengo 5 años trabajando de manera remota/virtual.",
  photo: URI.open("https://avatars.githubusercontent.com/u/72904191?v=4")
}, {
  email: "erichoare@gmail.com",
  password: "123123",
  username: "El Arquitecto",
  full_name: "Eric Hoare",
  phone_number: "981155420",
  birthday: Date.new(1976-5-7),
  address: "Rojas 699, Buenos Aires, Argentina",
  description: "My name is Eric Hoare, I'm 36 years old. For years, I worked in the oil industry leading a team in charge of installing well casing and torque inspection. About 4 years ago I decided to make a radical change in my life and pursue architecture. I'm currently in my 4th year of the career.",
  photo: URI.open("https://avatars0.githubusercontent.com/u/75059530?v=4")
}, {
  email: "jesushuiza@gmail.com",
  password: "123123",
  username: "Comadreja",
  full_name: "Jesus Huiza",
  phone_number: "900056158",
  birthday: Date.new(1976-5-7),
  address: "Pedro Moran 2500, Buenos Aires, Argentina",
  description: "Soy un profesional de informática en mainframe con mas de 20 años de experiencia queriendo conocer programar en nuevas plataformas. Tengo 47 años, vivo en Caracas, Mi expectativas son formarme para poder programar y dirigir a mi equipo de trabajo en nuevos proyectos.",
  photo: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1612744249/hm37mh36nqwxzlhebd8k.jpg")
}, {
  email: "juanillingworth@gmail.com",
  password: "123123",
  username: "Comerciante",
  full_name: "Juan Illingworth",
  phone_number: "529456123",
  birthday: Date.new(1976-5-7),
  address: "Manuel Ugarte 2011, Buenos Aires, Argentina",
  description: "Born in Guayaquil, Ecuador. Living in Buenos Aires for nine years now. Com Student at Universidad de Ciencias Empresariales y Sociales (BsAs) & Sommelier at Gato Dumas.",
  photo: URI.open("https://avatars.githubusercontent.com/u/74078499?v=4")
}, {
  email: "lupeperez@gmail.com",
  password: "123123",
  username: "La Artista",
  full_name: "Lucia Perez",
  phone_number: "987400183",
  birthday: Date.new(1976-5-7),
  address: "Sta María del Buen Aire 400, Buenos Aires, Argentina",
  description: "Hi, my name is Lucia. I´m a photographer, and i little bit of a videographer. Almost all my background is releated with design and arts, but i love programming so, here i am, trying to get into this awsome world.",
  photo: URI.open("https://avatars.githubusercontent.com/u/65425730?v=4")
}, {
  email: "emirodriguez@gmail.com",
  password: "123123",
  username: "El Contador",
  full_name: "Emiliano Rodriguez",
  phone_number: "980987123",
  birthday: Date.new(1976-5-7),
  address: "Arismendi 2801, Buenos Aires, Argentina",
  description: "I am an accountant and I am interested in learning programming to be able to incorporate new tools and technologies that add value to my professional career",
  photo: URI.open("https://avatars3.githubusercontent.com/u/75991836?v=4")
}, {
  email: "ariwaisburg@gmail.com",
  password: "123123",
  username: "Loco",
  full_name: "Ariel Waisburg",
  phone_number: "089836111",
  birthday: Date.new(1976-5-7),
  address: "Av. Callao 1046, Buenos Aires, Argentina",
  description: "I am Ariel, a 19 year old Argentine entrepreneur in love with startups, their development and data.",
  photo: URI.open("https://avatars.githubusercontent.com/u/72884862?v=4")
}, {
  email: "nicokennedy@gmail.com",
  password: "123123",
  username: "Cabeza",
  full_name: "Nicolas Kennedy",
  phone_number: "985556763",
  birthday: Date.new(1976-5-7),
  address: "Av. Dorrego 1782, Buenos Aires, Argentina",
  description: "I am the co-founder of El Semiller Cowrking. During my last years I've worked in the Oil & Gas industry (Exxon, etc.) and I'm currently looking forward for new challenges within the entrepreneurial world - close to Tech.",
  photo: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1570572891/jjnpprepy6ktoh1afgdz.jpg")
}, {
  email: "felihernandez@gmail.com",
  password: "123123",
  username: "La Fiera",
  full_name: "Feli Hernandez",
  phone_number: "987098762",
  birthday: Date.new(1976-5-7),
  address: "Pedernera 301, Buenos Aires, Argentina",
  description: "I'm an experienced teacher with great skills to take the best of every student. I love teaching.",
  photo: URI.open("https://avatars.githubusercontent.com/u/9454245?v=4")
}, {
  email: "nadiasalmen@gmail.com",
  password: "123123",
  username: "Official Originex's TA",
  full_name: "Nadia Salmen",
  phone_number: "456456190",
  birthday: Date.new(1976-5-7),
  address: "Washington 501, Buenos Aires, Argentina",
  description: "Industrial engineer experienced in supply chain, logistics and business planning.
  I want to learn to code to develop technological solutions for sustainability and environmental global issues through the use of data intelligence. I am currently in search of a professional change that allows me to work independently and gives me more flexibility.",
  photo: URI.open("https://avatars.githubusercontent.com/u/60677572?v=4")
}]

# {
#   email: "santicastillo@gmail.com",
#   password: "123123",
#   username: "Genio",
#   full_name: "Santiago Castillo",
#   phone_number: "987456123",
#   birthday: Date.new(1976-5-7),
#   address: "Paraguay 1450, Buenos Aires, Argentina",
#   description: "I'm 25 and from Argentina. I'm a chemical engineer but I want to make a radical change in my professional like, so I'm looking forward to learning web development and other new skills :)",
#   photo: URI.open("https://avatars0.githubusercontent.com/u/71985198?v=4")
# }, {
#   email: "santicastillo@gmail.com",
#   password: "123123",
#   username: "Genio",
#   full_name: "Santiago Castillo",
#   phone_number: "987456123",
#   birthday: Date.new(1976-5-7),
#   address: "Paraguay 1450, Buenos Aires, Argentina",
#   description: "I'm 25 and from Argentina. I'm a chemical engineer but I want to make a radical change in my professional like, so I'm looking forward to learning web development and other new skills :)",
#   photo: URI.open("https://avatars0.githubusercontent.com/u/71985198?v=4")
# }, {
#   email: "santicastillo@gmail.com",
#   password: "123123",
#   username: "Genio",
#   full_name: "Santiago Castillo",
#   phone_number: "987456123",
#   birthday: Date.new(1976-5-7),
#   address: "Paraguay 1450, Buenos Aires, Argentina",
#   description: "I'm 25 and from Argentina. I'm a chemical engineer but I want to make a radical change in my professional like, so I'm looking forward to learning web development and other new skills :)",
#   photo: URI.open("https://avatars0.githubusercontent.com/u/71985198?v=4")
# }, {
#   email: "santicastillo@gmail.com",
#   password: "123123",
#   username: "Genio",
#   full_name: "Santiago Castillo",
#   phone_number: "987456123",
#   birthday: Date.new(1976-5-7),
#   address: "Paraguay 1450, Buenos Aires, Argentina",
#   description: "I'm 25 and from Argentina. I'm a chemical engineer but I want to make a radical change in my professional like, so I'm looking forward to learning web development and other new skills :)",
#   photo: URI.open("https://avatars0.githubusercontent.com/u/71985198?v=4")
# }, {
#   email: "santicastillo@gmail.com",
#   password: "123123",
#   username: "Genio",
#   full_name: "Santiago Castillo",
#   phone_number: "987456123",
#   birthday: Date.new(1976-5-7),
#   address: "Paraguay 1450, Buenos Aires, Argentina",
#   description: "I'm 25 and from Argentina. I'm a chemical engineer but I want to make a radical change in my professional like, so I'm looking forward to learning web development and other new skills :)",
#   photo: URI.open("https://avatars0.githubusercontent.com/u/71985198?v=4")
# }, {
#   email: "santicastillo@gmail.com",
#   password: "123123",
#   username: "Genio",
#   full_name: "Santiago Castillo",
#   phone_number: "987456123",
#   birthday: Date.new(1976-5-7),
#   address: "Paraguay 1450, Buenos Aires, Argentina",
#   description: "I'm 25 and from Argentina. I'm a chemical engineer but I want to make a radical change in my professional like, so I'm looking forward to learning web development and other new skills :)",
#   photo: URI.open("https://avatars0.githubusercontent.com/u/71985198?v=4")
# }, {
#   email: "santicastillo@gmail.com",
#   password: "123123",
#   username: "Genio",
#   full_name: "Santiago Castillo",
#   phone_number: "987456123",
#   birthday: Date.new(1976-5-7),
#   address: "Paraguay 1450, Buenos Aires, Argentina",
#   description: "I'm 25 and from Argentina. I'm a chemical engineer but I want to make a radical change in my professional like, so I'm looking forward to learning web development and other new skills :)",
#   photo: URI.open("https://avatars0.githubusercontent.com/u/71985198?v=4")
# }, {
#   email: "santicastillo@gmail.com",
#   password: "123123",
#   username: "Genio",
#   full_name: "Santiago Castillo",
#   phone_number: "987456123",
#   birthday: Date.new(1976-5-7),
#   address: "Paraguay 1450, Buenos Aires, Argentina",
#   description: "I'm 25 and from Argentina. I'm a chemical engineer but I want to make a radical change in my professional like, so I'm looking forward to learning web development and other new skills :)",
#   photo: URI.open("https://avatars0.githubusercontent.com/u/71985198?v=4")
# }

USERS.each do |user|
  new_user = User.new(user)
  new_user.photo.attach(io: user[:photo], filename: "user.png", content_type: "image/png")
  new_user.save!
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
  description: "An escape room, also known as an escape game, is a game in which a team of players cooperatively discover clues, solve puzzles, and accomplish tasks in one or more rooms in order to progress and accomplish a specific goal in a limited amount of time. The goal is often to escape from the site of the game.",
  zone: "Palermo",
  photo: "data:image/jpeg;base64,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"
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
