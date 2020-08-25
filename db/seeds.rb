require "open-uri"

Trip.destroy_all
User.destroy_all
Booking.destroy_all

# USERS CREATION
puts "Seeding users..."
users = [
  [
    {
      email: "beargrylls@official.com",
      password: 'ManvsWild!',
      first_name: "Bear",
      last_name: "Grylls",
      description: "I am the guy from Man vs Wild",
      birth_date: "07/06/1974".to_date,
    },
    "https://i.guim.co.uk/img/media/f8a09f6439b4cd6155eb0279fc223d51464d1888/0_86_4708_2825/master/4708.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=4892d97c7b94e7cbdaf1c19783f67d1d"
  ],
  [
    {
      email: "Moundirlevrai@official.com",
      password: 'coucoucestmoundir',
      first_name: "Moundir",
      last_name: "Zoughari",
      description: "I am the guy from Koh-Lanta and i love you",
      birth_date: "04/09/1973".to_date,
    },
    "https://www.guide-de-survie.com/wp-content/uploads/MOUNDIR.png"
  ],
  [
    {
      email: "Denislevrai@official.com",
      password: 'coucoucestDenis',
      first_name: "Denis",
      last_name: "Brogniart",
      description: "Ha! Ha !",
      birth_date: "12/06/1963".to_date,
    },
    "https://pbs.twimg.com/profile_images/906040030820536320/qQZ5_sgF.jpg"
  ],
  [
    {
      email: "Kanyeofficial@official.com",
      password: 'heysguy567',
      first_name: "Kanye",
      last_name: "West",
      description: "I am a god",
      birth_date: "08/06/1977".to_date
    },
    "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5ed00f17d4a99d0006d2e738%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D154%26cropX2%3D4820%26cropY1%3D651%26cropY2%3D5314"
  ],
  [
    {
      email: "Squeezie@official.com",
      password: 'machin24',
      first_name: "Squeezie",
      last_name: "LeVrai",
      description: "Woaouh! Je suis trop chaud!",
      birth_date: "27/01/1996".to_date
    },
    "https://is3-ssl.mzstatic.com/image/thumb/Purple71/v4/38/bc/e2/38bce2e4-02b3-c9bd-5fc6-1fa84791437e/source/256x256bb.jpg"
  ],
  [
    {
      email: "BillGates@official.com",
      password: 'hellomicrosoftworld',
      first_name: "Bill",
      last_name: "Gates",
      description: "I created Microsoft =) Now I'm rich and I can travel around the world.",
      birth_date: "28/10/1955".to_date
    },
    "https://s3-us-west-1.amazonaws.com/gtvcdn/image/channel_logo_636572480135692098.jpg"
  ],
  [
    {
      email: "SpaceX@official.com",
      password: 'XXXXXXXX',
      first_name: "Elon",
      last_name: "Musk",
      description: "I could go to Mars. But I'd rather go to the beach.",
      birth_date: "28/06/1971".to_date
    },
    "https://s3-us-west-1.amazonaws.com/companies.comparably.com/25528/ceo_v1.jpg"
  ],
  [
    {
      email: "Beyoncee@official.com",
      password: 'sqgklenqf',
      first_name: "Beyoncé",
      last_name: "Knowles",
      description: "I want to discover the world and meet new people",
      birth_date: "04/09/1981".to_date
    },
    "https://c-sf.smule.com/rs-s-sg-1/sing_google/performance/cover/a4/b2/3893be42-ba02-4612-9019-8dd781bc71fa.jpg"
  ],
  [
    {
      email: "EmmanuelMacron@official.com",
      password: 'qrgzhtht',
      first_name: "Emmanuel",
      last_name: "Macron",
      description: "J'ai envie de voyager parce que c'est mon projet",
      birth_date: "21/12/1977".to_date
    },
    "https://pbs.twimg.com/profile_images/711916465977466881/KpslvShn.jpg"
  ],
  [
    {
      email: "harrisonford@official.com",
      password: 'sdfbfbfs',
      first_name: "Harrison",
      last_name: "Ford",
      description: "I want to go on an adventure like it's the 80's",
      birth_date: "13/07/1942".to_date
    },
    "https://d26oc3sg82pgk3.cloudfront.net/files/media/edit/image/4205/square_thumb%402x.jpg"
  ],
  [
    {
      email: "jeandujardin@official.com",
      password: 'dflhqgrqf',
      first_name: "Jean",
      last_name: "Dujardin",
      description: "Comment est votre blanquette?",
      birth_date: "19/06/1972".to_date
    },
    "https://pbs.twimg.com/profile_images/2952668177/4a8302fbfbe3b2bf1d0e2c3c7ce3303a.jpeg"
  ],
  [
    {
      email: "cristinacordula@gmail.com",
      password: 'isqdhrgiqreghif',
      first_name: "Cristina",
      last_name: "Córdula",
      description: "Love Fashion and travel with mes cheries!",
      birth_date: "30/10/1964".to_date
    },
    "https://media.melty.fr/article-3783779-square_256/media.jpg"
  ],
  [
    {
      email: "sophiemarceau@gmail.com",
      password: 'heiuegriuyiy',
      first_name: "Sophie",
      last_name: "Marceau",
      description: "Hey I'm Sophie Marceau! Coucou Louis ;)",
      birth_date: "17/11/1966".to_date
    },
    "https://res.cloudinary.com/enjoymovie/image/upload/w_256,h_256,c_fill,g_auto:faces/tfig5iuaj4lmq9tblbw0.jpg"
  ]
]

users.each do |user| iterated_user = User.new(user.first)
  file = URI.open(user.last)
  iterated_user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  # p iterated_user
  iterated_user.save!
end

puts "Done !"



# TRIPS CREATION

puts "Seeding trips ..."

trips = [
  [
    {
      title: "Road trip in Australia",
      description:" Amazing road trip for backpackers and nature lovers. We're gonna start our trip Melbourne and then go to Cairns and finally finish our journey in Darwin" ,
      destination: "Melbourne, Australia",
      budget_min: 1500,
      budget_max: 2500,
      departure_date: "20/08/2020".to_date,
      return_date: "29/09/2020".to_date,
      capacity: 4,
      user: User.all.sample
    },
    "https://images.unsplash.com/photo-1529108190281-9a4f620bc2d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1023&q=80"
  ],
  [
    {
      title: "Experience a magical christmas in New York",
      description: "Un jour j'irai à New York avec toi, toutes les nuits déconner,et voir aucun film en entier, ça va d'soi, Avoir la vie partagée, tailladée",
      destination: "New York, USA",
      budget_min: 1000,
      budget_max: 2000,
      departure_date: "20/12/2020".to_date,
      return_date: "5/01/2021".to_date,
      capacity: 4,
      user: User.all.sample
    },
    "https://images.unsplash.com/photo-1534430480872-3498386e7856?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  ],
  [
    {
      title: "Discover the Reunion Island",
      description:"Venez avec moi à la Réunion! L'île de la Réunion est un département français de l'océan Indien. Elle est réputée pour son intérieur volcanique recouvert de forêt tropicale, ses récifs de corail et ses plages" ,
      destination:"Saint-Denis, La Reunion" ,
      budget_min: 1500,
      budget_max: 3000,
      departure_date: "20/08/2020".to_date,
      return_date: "17/09/2020".to_date,
      capacity: 4,
      user: User.all.sample
    },
    "https://www.decisionsdurables.com/wp-content/uploads/2017/03/la_reunion_vue_du_ciel02_-_credit_irt_-_serge_gelabert_dts_12_2014.jpg"
  ],
  [
    {
      title: "Horsing and chilling in Camargue",
      description:"Le Parc naturel régional de Camargue est situé au bord de la Méditerranée, à l’intérieur du delta du Rhône, principalement entre les deux bras du fleuve.",
      destination:"Camargue, France" ,
      budget_min: 350,
      budget_max: 400,
      departure_date: "22/08/2020".to_date,
      return_date: "31/08/2020".to_date,
      capacity: 4,
      user: User.all.sample
    },
    "https://images.unsplash.com/photo-1565622832101-358788927c53?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  ],
  [
    {
      title: "Week End à Rome",
      description: "Week-end à Rome, Tous les deux sans personne, Florence, Milan, s'il y a le temps, Week-end rital, en bagnole de fortune, variété mélo à la radio, Week-end rital.",
      destination: "Rome, Italy",
      budget_min: 350,
      budget_max: 850,
      departure_date: "28/08/2020".to_date,
      return_date: "31/08/2020".to_date,
      capacity: 2,
      user: User.all.sample
    },
    "https://images.unsplash.com/photo-1546946590-5d739771abc4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1512&q=80"
  ],
  [
    {
      title: "From Russia with Love",
      description: "Dream weekend at the motherland. Russia, the largest nation in the world, borders European and Asian countries, as well as the Pacific and Arctic Oceans.",
      destination: "Moscow, Russia",
      budget_min: 200,
      budget_max: 700,
      departure_date: "04/09/2020".to_date,
      return_date: "07/09/2020".to_date,
      capacity: 2,
      user: User.all.sample
    },
    "https://images.unsplash.com/photo-1547448415-e9f5b28e570d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
  ]
]

trips.each do |trip| iterated_trip = Trip.new(trip.first)
  file = URI.open(trip.last)
  iterated_trip.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  # p iterated_trip
  iterated_trip.save!
end

puts "Done !"



# # BOOKINGS CREATION

puts "Seeding bookings..."




# User.all.each do |user|
#   5.times do


#     Booking.create!(
#     user: user,
#     trip: Trip.all.sample,
#     description: "I would love to join this trip!",
#     accepted: true,
#     )

#   end
# end


descriptions = ["descript1", "descript2", "descript3", "fder"]

8.times do
# vérifie que que le trip n'est pas plein, sinon on en prend un autre au hasard
  trip = Trip.all.sample
  until trip.capacity > trip.users.count + 1
      trip = Trip.all.sample
  end

# vérifie que le user n'est pas déjà présent dans le trip
  user = User.all.sample
  while trip.users.include?(user) || trip.user == user
    user = User.all.sample
  end

  Booking.create!(user: user, trip: trip, description: descriptions.sample, accepted: true)
end
# 10.times do
#   while
#   Booking.create!(
#     user: User.all.sample,
#     trip: Trip.all.sample,
#     description: "I would love to join this trip!",
#     accepted: true
#   )
# end

puts "Done !"

# booking_1 = Booking.create!(
#   user: user_1,
#   trip: trip_1,
#   description: "I would love to join this trip!",
#   accepted: true
#   )

# booking_2 = Booking.create!(
#   user: user_2,
#   trip: trip_1,
#   description: "I would love to join this trip lol",
#   accepted: true
#   )

# booking_1 = Booking.create!(
#   user: user_3,
#   trip: trip_1,
#   description: "I would love to join this trip!",
#   accepted: true
#   )

# booking_1 = Booking.create!(
#   user: user_1,
#   trip: trip_2,
#   description: "I would love to join this trip!",
#   accepted: true
#   )

# booking_1 = Booking.create!(
#   user: user_2,
#   trip: trip_2,
#   description: "I would love to join this trip!",
#   accepted: true
#   )

# booking_1 = Booking.create!(
#   user: user_1,
#   trip: trip_3,
#   description: "I would love to join this trip!",
#   accepted: true
#   )
