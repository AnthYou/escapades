require "open-uri"

# Destroy all previous instances
t0 = Time.now
puts "Destroy previous instances..."

Review.destroy_all
Post.destroy_all
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
      email: "beargrylls@official.com",
      password: 'ManvsWild!',
      first_name: "Bear",
      last_name: "Grylls",
      description: "I am the guy from Man vs Wild",
      date_of_birth: "07/06/1974".to_date,
    },
    "https://i.guim.co.uk/img/media/f8a09f6439b4cd6155eb0279fc223d51464d1888/0_86_4708_2825/master/4708.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=4892d97c7b94e7cbdaf1c19783f67d1d"
  ],
  [
    {
      email: "moundir@official.com",
      password: 'coucoucestmoundir',
      first_name: "Moundir",
      last_name: "Zoughari",
      description: "I am the guy from Koh-Lanta and i love you",
      date_of_birth: "04/09/1973".to_date,
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
      date_of_birth: "12/06/1963".to_date,
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
      date_of_birth: "08/06/1977".to_date
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
      date_of_birth: "27/01/1996".to_date
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
      date_of_birth: "28/10/1955".to_date
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
      date_of_birth: "28/06/1971".to_date
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
      date_of_birth: "04/09/1981".to_date
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
      date_of_birth: "21/12/1977".to_date
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
      date_of_birth: "13/07/1942".to_date
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
      date_of_birth: "19/06/1972".to_date
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
      date_of_birth: "30/10/1964".to_date
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
      date_of_birth: "17/11/1966".to_date
    },
    "https://res.cloudinary.com/enjoymovie/image/upload/w_256,h_256,c_fill,g_auto:faces/tfig5iuaj4lmq9tblbw0.jpg"
  ]
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
      departure_date: "21/07/2020".to_date,
      return_date: "23/08/2020".to_date,
      max_capacity: 6,
      user: User.first
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
      user: User.all.sample
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
      departure_date: "20/08/2020".to_date,
      return_date: "17/09/2020".to_date,
      max_capacity: 6,
      user: User.all.sample
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
      user: User.all.sample
    },
    "https://images.unsplash.com/photo-1565622832101-358788927c53?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
  ],
  [
    {
      title: "Week End to Rome",
      description: "I want to go to Italy with someone cheerful. I plan to see the main tourist spots as well as good restaurants.",
      country: "Italy",
      city: "Roma, Lazio, Italy",
      budget_min: 350,
      budget_max: 850,
      departure_date: "28/08/2020".to_date,
      return_date: "31/08/2020".to_date,
      max_capacity: 4,
      user: User.all.sample
    },
    "https://images.unsplash.com/photo-1546946590-5d739771abc4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1512&q=80"
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
      user: User.all.sample
    },
    "https://images.unsplash.com/photo-1547448415-e9f5b28e570d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
  ]
]


trips.each do |trip|
  iterated_trip = Trip.new(trip.first)
  file = URI.open(trip.last)
  iterated_trip.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  iterated_trip.save!
  Booking.create(trip_id: iterated_trip.id, user_id: iterated_trip.user.id, status:'accepted')
end

puts "Done !"



# # BOOKINGS CREATION ====================================

puts "Seeding bookings..."

status = ["pending", "accepted", "declined", "cancelled"]

7.times do
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

  Booking.create!(user: user, trip: trip, status: "accepted")
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
      content: "You are such a beautiful person <3",
      stars: 5,
    },
    {
      content: "You suck man",
      stars: 0,
    },
    {
      content: "I had a very good time with you =)",
      stars: 4,
    },
    {
      content: "So many good memories with you my friend!!",
      stars: 5,
    }
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
      start_date: "21/07/2020".to_date,
      end_date: "28/07/2020".to_date,
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
      start_date: "29/07/2020".to_date,
      end_date: "04/08/2020".to_date,
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
      start_date: "05/08/2020".to_date,
      end_date: "20/08/2020".to_date,
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
      start_date: "21/08/2020".to_date,
      end_date: "22/08/2020".to_date,
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
