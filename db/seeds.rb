User.create!(name:  "Example",
             surname: "User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             pesel: "93032213997",
             admin:     true,
             activated: true)

99.times do |n|
  name = Faker::Name.name.split(' ')
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name[0],
               email: email,
               surname: name[1],
               pesel: "93032213997",
               password:              password,
               activated: true,
               password_confirmation: password)
end



users = User.all
user  = users.first



Comment.create!(trip_id: 1, user_id: 1, text: "Fajne fajne", grade: 5)
Comment.create!(trip_id: 2, user_id: 1, text: "Fajne niezbyt", grade: 1)

Country.create!(name: "Polska")
Country.create!(name: "Afryka")

Trip.create!(title: "Drach",
            text: "Cool trip, I reccomend",
            country_id: 1,
            user_id: 1,
            grade: 3
            )


99.times do |n|
  author  = Faker::Name.name
  title = "Trip part #{n+1}"
  Trip.create!(title: title,
            text: "Cool trip, I reccomend",
            country_id: 1,
            user_id: 1,
            grade: 3
            )
end
