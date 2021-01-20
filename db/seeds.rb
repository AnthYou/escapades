require "open-uri"

# Destroy all previous instances
t0 = Time.now
puts "Destroy previous instances..."

Review.destroy_all
Post.destroy_all
Notification.destroy_all
Message.destroy_all
Booking.destroy_all
User.destroy_all
Trip.destroy_all
Activity.destroy_all

puts "Done !"
# USERS CREATION =========================================
puts "Seeding users..."

users = [
    [
    {
      email: "ceciledezy@gmail.com",
      password: '123456',
      first_name: "Cecile",
      last_name: "Dezy",
      description: "Hey I'm Cecile Dezy! ;)",
      date_of_birth: "17/11/1990".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1539599254/janttrofl6xagki5zk6g.jpg"
  ],
  [
    {
      email: "kenzamahresi@official.com",
      password: '123456',
      first_name: "Kenza",
      last_name: "Mahresi",
      description: "Hey I'm Kenza Mahresi!",
      date_of_birth: "07/06/1974".to_date,
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1596040834/t9woatfkaltgi61oulex.jpg"
  ],
  [
    {
      email: "augustinlazarus@official.com",
      password: '123456',
      first_name: "Augustin",
      last_name: "Lazarus",
      description: "Hey, I'm Augustin Lazarus!",
      date_of_birth: "04/09/1973".to_date,
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1593091081/hqyjruqc2m9ckock4edx.jpg"
  ],
  [
    {
      email: "eliottmogenet@gmail.com",
      password: '123456',
      first_name: "Eliott",
      last_name: "Mogenet",
      description: "Hello, I'm Eliott Mogenet",
      date_of_birth: "27/01/1996".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1597912687/tmy20aexx0mnpwled9nt.jpg"
  ],
  [
    {
      email: "thomasdesmoulins@gmail.com",
      password: '123456',
      first_name: "Thomas",
      last_name: "Desmoulins",
      description: "Hey I'm Thomas Desmoulins! ;)",
      date_of_birth: "17/11/1985".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1585588520/j0m6tlufeayghsj1uqdv.jpg"
  ],
  [
    {
      email: "paulportier@official.com",
      password: '123456',
      first_name: "Paul",
      last_name: "Portier",
      description: "I want to discover the world and meet new people",
      date_of_birth: "04/09/1991".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1583704409/r5cbmwhshuvafp3v7jmm.jpg"
  ],
  [
    {
      email: "bradfujimoto@official.com",
      password: '123456',
      first_name: "Brad",
      last_name: "Fujimoto",
      description: "I want to travel all around the world with new people!",
      date_of_birth: "21/12/1990".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1592926912/otakmmkny8grdmruc4pq.jpg"
  ],
  [
    {
      email: "juliedakoure@official.com",
      password: '123456',
      first_name: "Julie",
      last_name: "Dakouré",
      description: "Hello guys, I'm Julie Dakouré",
      date_of_birth: "19/06/1972".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1586169339/baxobcnafstr5uvmp1iw.jpg"
  ],
  [
    {
      email: "isabellelafont@gmail.com",
      password: '123456',
      first_name: "Isabelle",
      last_name: "Lafont",
      description: "Hello guys, I'm Isabelle Lafont!",
      date_of_birth: "30/10/1964".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1593433763/mpgeqtybt7ftjnbrk7zj.jpg"
  ],

  [
    {
      email: "louismauriac@gmail.com",
      password: '123456',
      first_name: "Louis",
      last_name: "Mauriac",
      description: "Hey I'm Louis Mauriac!",
      date_of_birth: "17/11/1990".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1594803455/cx8uggkt52p2e8j7mbuv.jpg"
  ],

  [
    {
      email: "anthonyyou@gmail.com",
      password: '123456',
      first_name: "Anthony",
      last_name: "You",
      description: "I love to travel with amazing people!",
      date_of_birth: "17/11/1993".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1597872878/ykktauyyzddh4mkkrzd2.jpg"
  ],

  [
    {
      email: "raphaeltoubiana@gmail.com",
      password: '123456',
      first_name: "Raphael",
      last_name: "Toubiana",
      description: "Hey I'm Raphael Toubiana! ;)",
      date_of_birth: "17/11/1993".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1598027117/lg7kzhcjqieldye3ffmg.jpg"
  ],
  [
    {
      email: "eugenieavedikian@gmail.com",
      password: '123456',
      first_name: "Eugénie",
      last_name: "Avedikian",
      description: "Hey I'm Eugenie Avedikian! ;)",
      date_of_birth: "17/11/1993".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1598194006/pub2eya930lxyhpjqfof.jpg"
  ],
  [
    {
      email: "nicolaschevalier@gmail.com",
      password: '123456',
      first_name: "Nicolas",
      last_name: "Chevalier",
      description: "Hey I'm Nicolas Chevalier! ;)",
      date_of_birth: "17/11/1993".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1597852803/ynwdfogs8xfmzqonmo2f.jpg"
  ],
  [
    {
      email: "elsakrief@gmail.com",
      password: '123456',
      first_name: "Elsa",
      last_name: "Kiefer",
      description: "Hey I'm Elsa Kiefer",
      date_of_birth: "17/11/1993".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1598975754/yqvb1mn4ughztj2mhp7o.jpg"
  ],
  [
    {
      email: "oceaneleroy@gmail.com",
      password: '123456',
      first_name: "Oceane",
      last_name: "Leroy",
      description: "Hey I'm Oceane Leroy! ;)",
      date_of_birth: "17/11/1993".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1597859853/hlm3ivjlz0tezolmvyvo.jpg"
  ],
   [
    {
      email: "basilequinchon@gmail.com",
      password: '123456',
      first_name: "Basile",
      last_name: "Quinchon",
      description: "Hey I'm Basile Quinchon! ;)",
      date_of_birth: "17/11/1993".to_date
    },
    "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1574093268/su3s4sskyn9slfzihiez.jpg"
  ],
]

users.each do |user| iterated_user = User.new(user.first)
  file = URI.open(user.last)
  iterated_user.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  iterated_user.save!
end

puts "Done !"



# TRIPS CREATION ====================================================

puts "Seeding trips ..."

trips = [
  [
    {
      title: "Road trip in Australia",
      description:" Amazing road trip for backpackers and nature lovers. We're gonna start our trip Melbourne and then go to Cairns and finally finish our journey in Darwin" ,
      country: "Australia",
      budget_min: 1500,
      budget_max: 2500,
      departure_date: "21/07/2021".to_date,
      return_date: "23/08/2021".to_date,
      max_capacity: 6,
      user: User.first,
      tag_list: ["Oceania", "Adventure"]
    },
    "https://images.unsplash.com/photo-1529108190281-9a4f620bc2d8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1023&q=80"
  ],
  [
    {
      title: "Experience a magical christmas in New York",
      description: "This christmas we'll go to New York. I'd like to with 3 people to discover the big apple",
      country: "United States of America",
      city: "New York, United States of America",
      budget_min: 1000,
      budget_max: 2000,
      departure_date: "20/12/2020".to_date,
      return_date: "5/01/2021".to_date,
      max_capacity: 6,
      user: User.all.sample,
      tag_list: ["America", "Cultural", "Party"]
    },
    "https://images.unsplash.com/photo-1534430480872-3498386e7856?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  ],
  [
    {
      title: "Discover the Reunion Island",
      description:"Come with me to La Reunion! La Reunion Island is a French department in the Indian Ocean. It is famous for its volcanic interior covered with tropical forest, its coral reefs and its beaches." ,
      country: "France",
      city: "Saint-Denis, La Réunion, France",
      budget_min: 1500,
      budget_max: 3000,
      departure_date: "20/08/2021".to_date,
      return_date: "17/09/2021".to_date,
      max_capacity: 6,
      user: User.all.sample,
      tag_list: ["Islands", "Adventure", "Chill"]
    },
    "https://www.decisionsdurables.com/wp-content/uploads/2017/03/la_reunion_vue_du_ciel02_-_credit_irt_-_serge_gelabert_dts_12_2014.jpg"
  ],
  [
    {
      title: "Horsing and chilling in Camargue",
      description: "The Camargue Regional Natural Park is located on the shores of the Mediterranean, inside the Rhône delta, mainly between the two arms of the river.",
      country: "France",
      city: "Arles, Provence-Alpes-Côte d'Azur, France",
      budget_min: 350,
      budget_max: 400,
      departure_date: "22/08/2020".to_date,
      return_date: "31/08/2020".to_date,
      max_capacity: 6,
      user: User.all.sample,
      tag_list: ["Europe", "Chill"]
    },
    "https://images.unsplash.com/photo-1565622832101-358788927c53?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  ],

  [
    {
      title: "Biarritz on fire",
      description: "Come and spend an incredible time in a charming private villa. Discover the activities and the region. Fun, chill and sunw! ",
      country: "France",
      city: "Biarritz, Nouvelle-Aquitaine, France",
      budget_min: 350,
      budget_max: 400,
      departure_date: "4/09/2021".to_date,
      return_date: "6/09/2021".to_date,
      max_capacity: 6,
      user: User.all.sample,
      tag_list: ["Chill", "Europe"]
    },
    "https://images.unsplash.com/photo-1451159289881-10709108b343?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  ],

  [
    {
      title: "City Break à Stockholm",
      description: "Come and spend an exotic and rejuvenating weekend! ",
      country: "Sweden",
      city: "Stockholm, Stockholms Iän, Sweden",
      budget_min: 340,
      budget_max: 400,
      departure_date: "4/09/2020".to_date,
      return_date: "7/09/2020".to_date,
      max_capacity: 6,
      user: User.all.sample,
      tag_list: ["Chill", "Europe"]
    },
    "https://images.unsplash.com/photo-1509356843151-3e7d96241e11?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
  ],

  [
    {
      title: "Safari in Tanzania",
      description: "Put your hat and your rangers on! Don't forget your binoculars!",
      country: "Tanzania",
      city: "Zanzibar, Unguja Mijni Magharibi, Tanzania",
      budget_min: 2500,
      budget_max: 3000,
      departure_date: "10/09/2021".to_date,
      return_date: "25/09/2021".to_date,
      max_capacity: 4,
      user: User.all.sample,
      tag_list: ["Africa", "Adventure"]
    },
    "https://images.unsplash.com/photo-1516426122078-c23e76319801?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1348&q=80"
  ],

  [
    {
      title: "Northern Lights in Norway",
      description: "Discover northern lights during an incredible roadtrip",
      country: "Norway",
      budget_min: 1300,
      budget_max: 1600,
      departure_date: "20/12/2020".to_date,
      return_date: "5/01/2021".to_date,
      max_capacity: 4,
      user: User.all.sample,
      tag_list: ["Europe", "Adventure"]
    },
    "https://images.unsplash.com/photo-1579033461380-adb47c3eb938?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80"
  ],

  [
    {
      title: "Weekend to Rome",
      description: "I want to go to Italy with someone cheerful. I plan to see the main tourist spots as well as good restaurants.",
      country: "Italy",
      city: "Roma, Lazio, Italy",
      budget_min: 350,
      budget_max: 850,
      departure_date: "28/08/2020".to_date,
      return_date: "31/08/2020".to_date,
      max_capacity: 4,
      user: User.all.sample,
      tag_list: ["Europe", "Low-budget", "Cultural"]
    },
    "https://images.unsplash.com/photo-1546946590-5d739771abc4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1512&q=80"
  ],

  [
    {
      title: "Bali: Sea, chill and sun",
      description: "Discover Bali with great team mates ",
      country: "Indonesia",
      city: "Bali Mester, Daerah Khusus Ibukota Jakarta, Indonesia",
      budget_min: 2000,
      budget_max: 2500,
      departure_date: "10/09/2020".to_date,
      return_date: "25/09/2020".to_date,
      max_capacity: 5,
      user: User.all.sample,
      tag_list: ["Chill", "Oceania"]
    },
    "https://images.unsplash.com/photo-1537996194471-e657df975ab4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=754&q=80"
  ],

  [
    {
      title: "From Russia with Love",
      description: "Dream weekend at the motherland. Russia, the largest nation in the world, borders European and Asian countries, as well as the Pacific and Arctic Oceans.",
      country: "Russia",
      budget_min: 200,
      budget_max: 700,
      departure_date: "04/09/2020".to_date,
      return_date: "07/09/2020".to_date,
      max_capacity: 3,
      user: User.all.sample,
      tag_list: ["Asia", "Europe", "Cultural"]
    },
    "https://images.unsplash.com/photo-1547448415-e9f5b28e570d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
  ],
  [
    {
      title: "Loco Morocco",
      description: "Let's discover Morocco all together! We will chill and party hard, so don't hesitate to join!",
      country: "Morocco",
      city: "Casablanca, Morroco",
      budget_min: 200,
      budget_max: 700,
      departure_date: "18/10/2021".to_date,
      return_date: "06/11/2021".to_date,
      max_capacity: 6,
      user: User.all.sample,
      tag_list: ["Middle East", "Party", "Chill"]
    },
    "https://images.unsplash.com/photo-1505576391880-b3f9d713dc4f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80"
  ],
  [
    {
      title: "Sahara Desert",
      description: "Let's discover Algeria all together! We will chill and visit the isolating village in Algeria's wild Sahara desert. Don't hesitate to join!",
      country: "Algeria",
      city: "Tamanghasset, Tamanrasset, Algeria",
      budget_min: 400,
      budget_max: 1000,
      departure_date: "01/10/2021".to_date,
      return_date: "06/10/2021".to_date,
      max_capacity: 6,
      user: User.all.sample,
      tag_list: ["Africa", "Cultural", "Adventure"]
    },
    "https://images.unsplash.com/photo-1545167496-c1e092d383a2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=682&q=80"
  ],

  [
    {
      title: "Party in Amsterdam",
      description: "Let's take several walks in this beautiful city ! ",
      country: "The Netherlands",
      city: "Amsterdam, Noord-Holland, The Netherlands",
      budget_min: 200,
      budget_max: 400,
      departure_date: "06/09/2020".to_date,
      return_date: "10/09/2020".to_date,
      max_capacity: 6,
      user: User.all.sample,
      tag_list: ["Europe", "Party", "Chill"]
    },
    "https://images.unsplash.com/photo-1549701455-d0d42354b009?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  ],

  [
    {
      title: "Break in Lisbon",
      description: "Let's enjoy a great and short experience with mates in Lisbon!",
      country: "Portugal",
      city: "Lisbon, Portugal",
      budget_min: 200,
      budget_max: 400,
      departure_date: "07/09/2020".to_date,
      return_date: "10/09/2020".to_date,
      max_capacity: 4,
      user: User.all.sample,
      tag_list: ["Europe", "Party", "Chill"]
    },
    "https://images.unsplash.com/photo-1513377888081-794d8e958972?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  ],

  [
    {
      title: "London tour",
      description: "Let's improve our English, and test all the best nightclub of the city",
      country: "England",
      city: "London, England, United Kingdom",
      budget_min: 200,
      budget_max: 400,
      departure_date: "08/09/2020".to_date,
      return_date: "11/09/2020".to_date,
      max_capacity: 4,
      user: User.all.sample,
      tag_list: ["Europe", "Party", "Chill"]
    },
    "https://images.unsplash.com/photo-1505761671935-60b3a7427bad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  ],

  [
    {
      title: "Barcelona with new people!",
      description: "Let's enjoy a fun journey with mates",
      country: "Spain",
      city: "Barcelona, Catalunya, Spain",
      budget_min: 200,
      budget_max: 400,
      departure_date: "4/09/2021".to_date,
      return_date: "14/09/2021".to_date,
      max_capacity: 4,
      user: User.all.sample,
      tag_list: ["Europe", "Party", "Chill"]
    },
    "https://images.unsplash.com/photo-1529551739587-e242c564f727?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1790&q=80"
  ],
  [
    {
      title: "Japan Style",
      description: "Let's enjoy a fun journey with mates",
      country: "Japan",
      city: "Tokyo, Japan",
      budget_min: 200,
      budget_max: 400,
      departure_date: "15/12/2020".to_date,
      return_date: "25/12/2020".to_date,
      max_capacity: 4,
      user: User.all.sample,
      tag_list: ["Asia", "Cultural", "Party"]
    },
    "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1542&q=80"
  ],

  [
    {
      title: "Tahiti and cocktails",
      description: "Let's enjoy a fun journey with mates",
      country: "Tahiti, French Polynesia",
      city: "Papeete, Tahiti",
      budget_min: 3000,
      budget_max: 4000,
      departure_date: "20/09/2020".to_date,
      return_date: "5/10/2020".to_date,
      max_capacity: 4,
      user: User.all.sample,
      tag_list: ["Islands", "Chill", "Party"]
    },
    "https://images.unsplash.com/photo-1597851788739-bfd9500ea406?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1510&q=80"
  ],

  [
    {
      title: "Discover Nepal",
      description: "Let's enjoy a fun journey with mates",
      country: "Nepal",
      city: "Kathmandu, Nepal",
      budget_min: 2000,
      budget_max: 3000,
      departure_date: "10/09/2020".to_date,
      return_date: "24/10/2020".to_date,
      max_capacity: 4,
      user: User.all.sample,
      tag_list: ["Asia", "Adventure"]
    },
    "https://images.unsplash.com/photo-1531132734102-441c78aa0091?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  ],
  [
    {
      title: "Discover Cuba",
      description: "Let's enjoy a fun journey with mates",
      country: "Cuba",
      budget_min: 2000,
      budget_max: 3000,
      departure_date: "10/10/2021".to_date,
      return_date: "24/11/2021".to_date,
      max_capacity: 4,
      user: User.all.sample,
      tag_list: ["America", "Cultural", "Party"]
    },
    "https://images.unsplash.com/photo-1503192851959-c6da8ac80cff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80"
  ],
]

trips.each do |trip|
  iterated_trip = Trip.new(trip.first)
  file = URI.open(trip.last)
  iterated_trip.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  iterated_trip.save!
  Booking.create(trip_id: iterated_trip.id, user_id: iterated_trip.user.id, status: 'accepted')
end

puts "Done!"



# # BOOKINGS CREATION ====================================

puts "Seeding bookings..."

status = ["pending", "accepted", "declined", "cancelled"]

5.times do
  Booking.create(user: User.all.sample, trip: Trip.first, status: "accepted")
end

20.times do
# vérifie que que le trip n'est pas plein, sinon on en prend un autre au hasard
  trip = Trip.all.sample
  until trip.max_capacity > trip.users.count
      trip = Trip.all.sample
  end

# vérifie que le user n'est pas déjà présent dans le trip
  user = User.all.sample
  while trip.users.include?(user) || trip.user == user
    user = User.all.sample
  end

  Booking.create(user: user, trip: trip, status: "accepted")
end


puts "Done !"

# # REVIEWS CREATION =====================================
puts "Seeding reviews..."

reviews = [
    {
      content: "You were amazing mate =)",
      stars: 5
    },
    {
      content: "I really enjoy the trip with you =)",
      stars: 5
    },
    {
      content: "We experienced a beautiful adventure together =)",
      stars: 4
    },
    {
      content: "You are such a beautiful person <3",
      stars: 5,
    },
    {
      content: "I did not appreciate the experience.",
      stars: 2,
    },
    {
      content: "I had a very good time with you =)",
      stars: 4,
    },
    {
      content: "So many good memories with you my friend!!",
      stars: 5,
    },
    {
      content: " I really enjoy the time I spent with you!!!",
      stars: 5,
    },

    {
      content: "I want to travel with you again! You're amazing!!",
      stars: 5,
    },

    {
      content: "We had so much fun together!",
      stars: 5,
    },

    {
      content: "We had a good time! ",
      stars: 5,
    },
  ]

20.times do

  user = User.all.sample

  booking = Booking.all.where.not(user: user).sample
  review = reviews.sample


# !!!! Il y a t'il une meilleure métode ??? car des creates peuvent échouer !

# --on regarde dans tous les reviews deja créés, si cette paire existe, on en prend une autre?

 # on ne peut pas laisser de review sur la même personne pour le même booking
  new_review = Review.new(content: review[:content], stars: review[:stars], user: user, booking: booking)

  new_review.save

end


puts "Done !"

# # POSTS CREATION ==================================
puts "Seeding posts..."

posts = [
  [
    {
      content: "My arrival at flinder's street",
      user: User.first,
      trip: Trip.first,

    },
    "https://images.unsplash.com/photo-1514395462725-fb4566210144?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1051&q=80"
  ],

  [
    {
      content: "I saw cute kangaroos in the outback",
      user: User.first,
      trip: Trip.first,

    },
    "https://images.unsplash.com/photo-1526515579900-98518e7862cc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1041&q=80"
  ],

  [
    {
      content: "Just arrived at Byron Bay! I'm ready to go surfing 😛",
      user: User.first,
      trip: Trip.first,

    },
    "https://images.unsplash.com/photo-1566761011348-57ccaa67ea69?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80"
  ],

  [
    {
      content: "A beautiful view from the 12 apostles.",
      user: User.first,
      trip: Trip.first,

    },
    "https://images.unsplash.com/photo-1596430222039-4a2d7b4cd767?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
  ],
  [
    {
      content: "I'm in a forest in Cairns. Now the adventure begins.",
      user: User.first,
      trip: Trip.first,

    },
    "https://images.unsplash.com/photo-1556592446-6113e4690ef7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1059&q=80"
  ],

  [
    {
      content: "Chillout time in Darwin.",
      user: User.first,
      trip: Trip.first,

    },
    "https://images.unsplash.com/photo-1579545564328-7d4aa4bc7df8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80"
  ],

  [
    {
      content: "Last step of my trip: Perth",
      user: User.first,
      trip: Trip.first,

    },
    "https://images.unsplash.com/photo-1524586410818-196d249560e4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1207&q=80"
  ],
]

posts.each do |post| iterated_post = Post.new(post.first)
  file = URI.open(post.last)
  iterated_post.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  iterated_post.save!
end

puts "Done !"

# # ACTIVITIES CREATION
puts "Seeding activities..."

activities = [
  [
    {
      title: "Discover Melbourne",
      description: "We're gonna explore the streets, drink coffee and discover the nightlife.",
      price: 100,
      start_date: "21/07/2021".to_date,
      end_date: "28/07/2021".to_date,
      city: "Melbourne, Victoria, Australia",
      country: "Australia",
      transport_type: "Plane",
      url: "https://www.visitmelbourne.com/",
      trip: Trip.first
    },
    "https://www.visitmelbourne.com/-/media/images/melbourne/destinations/hosier-lane_mel_u_1150x863.jpg?h=600&iar=1&mh=600&mw=800&w=800&ts=20160819210519&hash=0CDCB7187E606E03F09EEB11D05B42A8"
  ],
  [
    {
      title: "Diving at the great barrier reef",
      description: "A dive into the largest coral reef on earth",
      price: 800,
      start_date: "29/07/2021".to_date,
      end_date: "04/08/2021".to_date,
      city: "Cairns, Queensland, Australia",
      country: "Australia",
      transport_type: "Car",
      url: "https://www.australia.com/en/places/cairns-and-surrounds/guide-to-the-great-barrier-reef.html",
      trip: Trip.first
    },
    "https://s7ap1.scene7.com/is/image/destqueensland/teq/consumer/global/images/destinations/great-barrier-reef/blog-images/editorial-hero-banner/2019_GBR_OrpheusIsland_DivingAndSnorkeling_139623.jpg?fit=wrap&fmt=webp&qlt=40&wid=1200"
  ],
  [
    {
      title: "Desert trip to Uluru",
      description: "We can't do the climbing. But We'll admire this beautiful landscape anyway",
      price: 200,
      start_date: "05/08/2021".to_date,
      end_date: "20/08/2021".to_date,
      city: "Alice Springs, Northern Territory, Australia",
      country: "Australia",
      transport_type: "Plane",
      url: "https://parksaustralia.gov.au/uluru/",
      trip: Trip.first
    },
    "https://s1.at.atcdn.net/wp-content/uploads/2018/09/Uluru_hero-768x369.jpg"
  ],
  [
    {
      title: "Skydiving in Perth",
      description: "I hope you're not affraid hahaha. This is crazy!",
      price: 280,
      start_date: "21/08/2021".to_date,
      end_date: "22/08/2021".to_date,
      city: "Perth, Western Australia, Australia",
      country: "Australia",
      transport_type: "Car",
      url: "https://www.skydive.com.au/perth/",
      trip: Trip.first
    },
    "https://media-cdn.tripadvisor.com/media/photo-s/16/a7/53/4b/tandem-skydive-in-the.jpg"
  ],
]

activities.each do |activity| iterated_activity = Activity.new(activity.first)
  file = URI.open(activity.last)
  iterated_activity.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  iterated_activity.save!
end

puts "Done ! 🍺"
puts "In #{(Time.now - t0).to_i} seconds."
