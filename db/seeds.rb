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


Genre.create!(name: "Polska")
Genre.create!(name: "Afryka")

users = User.all
user  = users.first

Book.create!(title: "Drach",
            text: "Cool trip, I reccomend",
            genre_id: 1,
            user_id: 1,
            grade: 3
            )


99.times do |n|
  author  = Faker::Name.name
  title = "Trip part #{n+1}"
  Book.create!(title: title,
            text: "Cool trip, I reccomend",
            genre_id: 1,
            user_id: 1,
            grade: 3
            )
end

Copy.create!(book_id: 1, user_id: 1, text: "Fajne fajne", grade: 5)
Copy.create!(book_id: 2, user_id: 1, text: "Fajne niezbyt", grade: 1)