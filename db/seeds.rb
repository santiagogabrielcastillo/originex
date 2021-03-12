require 'open-uri'

puts "Cleaning database"
Event.destroy_all
Participant.destroy_all
Message.destroy_all
Chatroom.destroy_all
UserInterest.destroy_all
Activity.destroy_all
User.destroy_all

ACTIVITIES = [{
    title: "Go for a run",
    category: "Outdoor sports",
    description: "On the definitive list of amazing exercise activities,
     it’s an effective way to keep both your body and brain in great shape.
     Just lace up your running shoes and you’re ready to pound the pavement — or the treadmill, the track, the park, or the trail behind your house. 
     The options are endless. And you don’t have to carve out precious alone time to run, either. ",
    zone: "Palermo",
    photo: "https://images.unsplash.com/photo-1602619075660-d0f5459cb189?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80"
    }, {
    title: "BA Art exposition",
    category: "Cultural activities",
    description: "Buenos Aires has a lot more to offer if you’re willing to dig around a bit. 
    For those who enjoy art, or simply just want to get out the house and do something different, there are a lots of exhibitions hosted 
    by some of the trendiest and most alternative galleries in Buenos Aires.",
    zone: "Caballito",
    photo: "https://upload.wikimedia.org/wikipedia/commons/a/a5/Exposition_%22Gauguin%2C_Van_Gogh%2C_les_peintres_de_la_couleur%22.jpg"
  }, {
    title: "Pizza lovers",
    category: "Food and drinks",
    description: "Why pizza in Buenos Aires? Let’s go back to the roots of Buenos Aires. 
    Between 1857 and 1940 more than 3 million Italians immigrated to Buenos Aires. 
    That’s why Italian food is well integrated into the lifestyle of Buenos Aires. Pasta, strong coffee,
     and pizza!.",
    zone: "Flores",
    photo: "https://cdn.foodism.co.uk/featured_image/5c51a4ec43e1b.jpeg"
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
  zone: "Palermo",
  photo: "https://thesymphonyofrock.files.wordpress.com/2019/07/battle-of-the-bands.jpg?w=1440&h=580&crop=1"
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
  zone: "Núñez",
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
  zone: "Villa Urquiza",
  photo:"https://images.unsplash.com/photo-1532457573542-37fe94c98cf2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cGxheWluZyUyMGJvYXJkJTIwZ2FtZXN8ZW58MHwwfDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
}, {
  title: "Inline skating",
  category: "Outdoor sports",
  description: "Uses similar balance points, engages many of the same muscle groups from skiing, and many moves use the same body position. Over the past 10 years it has become more of a thing, and if there’s a good bike path I’ll blade for fun.",
  zone: "Versalles",
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
  full_name: "Maxi Amodei",
  phone_number: "987654321",
  birthday: Date.new(1990-1-9),
  address: "Av. Santa Fe 1298, Buenos Aires, Argentina",
  description: "Before joining Le Wagon I studied economics and finance and started working in planning and accounting sectors for a company. Then, after discovering it was a boring job I wanted to make a career shift and decided to join the bootcamp",
  photo: URI.open("https://avatars.githubusercontent.com/u/70491418?v=4")
  }, {
  email: "santicastillo@gmail.com",
  password: "123123",
  username: "Genio",
  full_name: "Santi Castillo",
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
  full_name: "Feli Hernez",
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
}, {
  email: "ferjacquier@gmail.com",
  password: "123123",
  username: "Pitbull",
  full_name: "Fernando Jacquier",
  phone_number: "127456983",
  birthday: Date.new(1976-5-7),
  address: "Cap. Justo G. de Bermúdez 1900, Buenos Aires, Argentina",
  description: "A porteño who is deeply in love with his city and convinced there's no place like Buenos Aires but... still has a strong desire to travel and experience different cultures. A sports fan that is not very good at any of them. Played football, golf, tennis, basketball... the list is long. At the moment giving Kung Fu a try.",
  photo: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1585760025/eheyqoggb1g6bxl9goes.jpg")
}, {
  email: "luxzhang@gmail.com",
  password: "123123",
  username: "Gorra",
  full_name: "Luis Zhang",
  phone_number: "987906161",
  birthday: Date.new(1976-5-7),
  address: "Campichuelo 500, Buenos Aires, Argentina",
  description: "Born in Argentina with chinese parents and culture. Chinese - Spanish translator and amateur photographer. Looking for new experiences in the programming area.",
  photo: URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1592660398/ws7p11dr8la37dacoyxq.jpg")
}, {
  email: "sebasbuffosempe@gmail.com",
  password: "123123",
  username: "EL Fundador",
  full_name: "Sebas Sempe",
  phone_number: "983336193",
  birthday: Date.new(1976-5-7),
  address: "Uriarte 2000, Buenos Aires, Argentina",
  description: "Driver Le Wagon Buenos Aires. Le Wagon is a product-driven bootcamp teaching Ruby, Ruby on Rails, JavaScript, HTML & CSS, APIs, Github, Heroku.",
  photo: URI.open("https://avatars.githubusercontent.com/u/18401014?s=460&u=f98d1f22574afd1ff6bc7638147e24ab2a4e7def&v=4")
}, {
  email: "gerardoraiden@gmail.com",
  password: "123123",
  username: "El Experimentado",
  full_name: "Gerardo Raiden",
  phone_number: "612398745",
  birthday: Date.new(1976-5-7),
  address: "Gurruchaga 806, Buenos Aires, Argentina",
  description: "Co-founder & CTO of boxful.io and increasing.co. Love OOP and Ruby on Rails. Using more and more React, React Native and StimulusJs.",
  photo: URI.open("https://avatars.githubusercontent.com/u/5191085?s=460&u=5522edb94f8e09f76f4e58c88a0c2385eff2ab14&v=4")
}]

USERS.each do |user|
  new_user = User.new(user)
  new_user.photo.attach(io: user[:photo], filename: "user.png", content_type: "image/png")
  new_user.activities = Activity.first(5)
  new_user.save!
end
puts "Users created"

CHATROOMS = [{
    title: "Runners from Caballito",
    description: "Good vibes! Cool, sporty and open-minded people are welcome.",
    activity_id: Activity.all[0].id
  }, {
    title: "Running for a dream",
    description: "Let's sweat to help!",
    activity_id: Activity.all[0].id
  }, {
    title: "Sunrise runners",
    description: "Fans of running until sunrise",
    activity_id: Activity.all[0].id
  } , {
    title: "To the lovely arts museum!",
    description: "Buenos Aires art lovers",
    activity_id: Activity.all[1].id
  }, {
    title: "Modern art unites us",
    description: "Passionate about modernity and what it generates in our world.",
    activity_id: Activity.all[1].id
  }, {
    title: "MALBA",
    description: "UBA students, we are going to get to know MALBA.",
    activity_id: Activity.all[1].id
  }, {
    title: "Pizza lovers",
    description: "We eat pizza like everyone else, we savor it like few others.",
    activity_id: Activity.all[2].id
  }, {
    title: "Guerrin and that's it.",
    description: "Guerrin has no comparison, that's why we are going to eat some pizzas and drink beer.",
    activity_id: Activity.all[2].id
  }, {
    title: "The special pizza: La Mezzetta",
    description: "Looking for people wanting to know new places to eat pizza, I got bored of them!",
    activity_id: Activity.all[2].id
  }, {
    title: "Tiro Federal",
    description: "Cool people for a 5vs5 match, who joins me?.",
    activity_id: Activity.all[3].id
  }, {
    title: "The saavedra tournament",
    description: "We are organizing a soccer tournament to have fun for a while and play in the park.",
    activity_id: Activity.all[3].id
  }, {
    title: "Futsal players",
    description: "Futsal players who want to talk about the league.",
    activity_id: Activity.all[3].id
  }, {
    title: "La vela puerca",
    description: "La vela puerca fans, we are looking for people to go to the recital next week.",
    activity_id: Activity.all[4].id
  }, {
    title: "Lollapalooza",
    description: "If you love international music, join to go to the festival.",
    activity_id: Activity.all[4].id
  }, {
    title: "Starting in music",
    description: "After 5 years together we want to say that we are going to do the first free recital!",
    activity_id: Activity.all[4].id
  }
]
  
CHATROOMS.first(7).each do |chatroom|
  new_chatroom = Chatroom.create!(chatroom)
  new_chatroom.users = User.first(6)
  new_chatroom.participants.each do |participant|
    participant.update(status: true)
  end
end

CHATROOMS.last(8).each do |chatroom|
  new_chatroom = Chatroom.create!(chatroom)
  new_chatroom.users = User.last(6)
  new_chatroom.participants.each do |participant|
    participant.update(status: true)
  end
end

puts "Chatrooms created"

EVENTS = [{
  status: "public",
  details: "You do not want to miss the opportunity to run through the beautiful fairways on a beautiful afternoon. Let's enjoy the art of sport!",
  date: DateTime.new(2021,3,20,15),
  activity_id: Activity.all[0].id,
  chatroom_id: Chatroom.all[0].id,
  address: "Gral. Martín de Gainza 401, Buenos Aires, Argentina",
  photo: URI.open("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/full-length-of-marathon-runners-having-a-race-royalty-free-image-1614784399.?crop=1.00xw:0.709xh;0,0.187xh&resize=320:*")

}, {
  status: "public",
  details: "Have you ever felt motivated? Inspired? Exactly that is what we want to generate in people with unhealthy conditions. Running, meeting people and making an impact on others are the objectives of this event.",
  date: DateTime.new(2021,4,9,21),
  activity_id: Activity.all[0].id,
  chatroom_id: Chatroom.all[1].id,
  address: "Av. Gral. Las Heras 3353, CABA, Argentina",
  photo: URI.open("https://www.manchestermarathon.co.uk/wp-content/uploads/sites/9/2018/11/Charity-runners.jpg")
}, {
  status: "public",
  details: "Usually someone sees this and thinks: 'how crazy they are' If you never ran at dawn, we invite you to join a group of people who love to do it, and if you did, join in and repeat it! We run until the sunrise.",
  date: DateTime.new(2021,4,2,5),
  activity_id: Activity.all[0].id,
  chatroom_id: Chatroom.all[2].id,
  address: "Billinghurst 2500, CABA, Argentina",
  photo: URI.open("https://image.freepik.com/free-photo/woman-running-beach-sunrise_101709-73.jpg")
}, {
  status: "public",
  details: "We are going to visit one of the most beautiful museums that the city of Buenos Aires has. We will explore cultures, artists and a lot of history, and then we will eat together. Do not miss it!",
  date: DateTime.new(2021,3,14,11),
  activity_id: Activity.all[1].id,
  chatroom_id: Chatroom.all[3].id,
  address: "Av. del Libertador 1473, Buenos Aires, Argentina",
  photo: URI.open("https://www.cultura.gob.ar/media/uploads/8740595698_4902f0f983_c.jpg")

}, {
  status: "public",
  details: "Attending the museum of modern art in Buenos Aires is a demonstration of interest in the magnificent modern era that our precious art has lived through. If that happens to you, do not hesitate to chat for a while and we will surely have a great time!",
  date: DateTime.new(2021,5,2,9),
  activity_id: Activity.all[1].id,
  chatroom_id: Chatroom.all[4].id,
  address: "Av. San Juan 350, Buenos Aires, Argentina",
  photo: URI.open("https://www.eluniversal.com.mx/sites/default/files/2020/08/15/reapertura_de_museos_cdmx.jpg")
}, {
  status: "public",
  details: "The guided tour offered by MALBA is an incredible space to exchange with people who are interested in art and at the same time talk with a guide who has a more specific knowledge. It is very lovely moment.",
  date: DateTime.new(2021,3,28,12),
  activity_id: Activity.all[1].id,
  chatroom_id: Chatroom.all[5].id,
  address: "San Martín de Tours 3001, Buenos Aires, Buenos Aires, Argentina",
  photo: URI.open("https://a0.muscache.com/pictures/ebc0f813-18d2-4a48-99f4-49981e99559e.jpg")
}, {
  status: "public",
  details: "The creators of the Pizza Canchera, since 1938. Not much have changed since then: one (extraordinary) pizza at a time, for the next in (your imaginary) line.Service is excellent and very friendly. Join us and let's enjoy eating pizza together!",
  date: DateTime.new(2021,3,20,15),
  activity_id: Activity.all[2].id,
  chatroom_id: Chatroom.all[6].id,
  address: "Av. Córdoba 5270, Buenos Aires, Argentina",
  photo: URI.open("https://images.clarin.com/2018/09/26/hotJoY_pK_720x0__1.jpg")

}, {
  status: "public",
  details: "An old famous pizza eatery with stand-up eating counters and also a sit down restaurant at back. The dough is thicker with lots of cheese on top. I had tried a traditional Argentinian recipe: onion, ham and cheese. Of course, don’t forget to drizzle some oregano on top when you eat it. They also serve empanadas which are freshly made in front of you. Would you miss it?",
  date: DateTime.new(2021,4,2,21),
  activity_id: Activity.all[2].id,
  chatroom_id: Chatroom.all[7].id,
  address: "Av. Corrientes 1368, Buenos Aires, Argentina",
  photo: URI.open("https://lamejorpizzeria.com/wp-content/uploads/2010/12/Pizzeria-Guerrin-buenos-aires.jpg")
}, {
  status: "public",
  details: "Pizzas in Argentine style, they called it fugazzeta, very tasty and have crispy crusts. A long established local eatery where most locals go, you can’t go wrong. Let's go together and have a fun.",
  date: DateTime.new(2021,4,2,5),
  activity_id: Activity.all[2].id,
  chatroom_id: Chatroom.all[8].id,
  address: "Virrey Olaguer y Feliú 2414, Buenos Aires, Argentina",
  photo: URI.open("https://800noticias.com/cms/wp-content/uploads/2019/02/masa-pizza-casera-700x352.jpg")
}, {
  status: "public",
  details: "Join a vibrant Argentine soccer match, where passion, competitiveness and love for colors always prevail on the field. Unique opportunity to meet other people and have fun for a while!",
  date: DateTime.new(2021,3,20,15),
  activity_id: Activity.all[3].id,
  chatroom_id: Chatroom.all[9].id,
  address: "Av. del Libertador 6905, Buenos Aires, Argentina",
  photo: URI.open("https://matenews.com.ar/media/k2/items/cache/0072fc861f8558ddd0a5b9efefe3ec0b_XL.jpg")

}, {
  status: "public",
  details: "You cannot miss this incredible opportunity to be part of one of the most attractive tournaments in Buenos Aires: the savedra tournament. We all play with great joy and at the end of the tournament we are going to eat an Argentine asado, the winner does not pay!",
  date: DateTime.new(2021,4,9,21),
  activity_id: Activity.all[3].id,
  chatroom_id: Chatroom.all[10].id,
  address: "Paroissien 3901, Buenos Aires, Argentina",
  photo: URI.open("https://www.udechile.cl/wp-content/uploads/2019/09/Sub-17-ante-Cobresal.jpg")
}, {
  status: "public",
  details: "Are you a fan of futsal? This sport that is not so well known in Argentina drives you crazy and do you want to get together to talk about the league and the sport itself? Come on Sunday at noon to eat at 'Glorias', the typical and traditional futsal place.",
  date: DateTime.new(2021,3,15,13),
  activity_id: Activity.all[3].id,
  chatroom_id: Chatroom.all[11].id,
  address: "Chacabuco 485, Provincia de Buenos Aires, Argentina",
  photo: URI.open("https://football-technology.fifa.com/media/172196/futsal.jpg")
}, {
  status: "public",
  details: "I can't explain what a La Vela Puerca recital in Buenos Aires is. The magic that you feel in the atmosphere, the good vibes of the people and the great music you listen to, make it a perfect night full of unforgettable moments.",
  date: DateTime.new(2021,5,16,21),
  activity_id: Activity.all[4].id,
  chatroom_id: Chatroom.all[12].id,
  address: "Humboldt 400, Buenos Aires, Argentina",
  photo: URI.open("https://www.metro951.com/wp-content/uploads/2016/11/La-Vela-Saludo-Final.jpg")
}, {
  status: "public",
  details: "A 3-day festival with 150,000 people who will go crazy for the great music that is heard. International bands from different parts of the world come together and give a sample of what art is. From the best known in the world, to some that are just beginning. Spectacular.",
  date: DateTime.new(2021,3,20,15),
  activity_id: Activity.all[4].id,
  chatroom_id: Chatroom.all[13].id,
  address: "Av. del Libertador 4175, Buenos Aires, Argentina",
  photo: URI.open("https://arc-anglerfish-arc2-prod-infobae.s3.amazonaws.com/public/C3RVB4JAV5BSDMO6PBEHQ6BD6Y.jpg")
  
  }, {
  status: "public",
  details: "Our band is called Sirio and it makes its public debut with a free recital so that you can enjoy and know our music. People wanting to jump, dance and sing always invited!",
  date: DateTime.new(2021,4,2,5),
  activity_id: Activity.all[4].id,
  chatroom_id: Chatroom.all[14].id,
  address: "Billinghurst 2500, Buenos Aires, Argentina",
  photo: URI.open("https://www.cmtv.com.ar/imagenes_artistas/2297.jpg?Sirio%20Rock")
}]

EVENTS.first(7).each do |event|
  new_event = Event.new(event)
  new_event.photo.attach(io: event[:photo], filename: "event.png", content_type: "image/png")
  new_event.chatroom.users = User.first(6)
  new_event.save!
  new_event.chatroom.participants.each do |participant|
    participant.update(status: true)
  end
end

EVENTS.last(8).each do |event|
  new_event = Event.new(event)
  new_event.photo.attach(io: event[:photo], filename: "event.png", content_type: "image/png")
  new_event.chatroom.users = User.last(6)
  new_event.save!
  new_event.chatroom.participants.each do |participant|
    participant.update(status: true)
  end
end
puts "Events created"

puts "Done:)"
