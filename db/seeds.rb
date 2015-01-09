User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end


Genre.create!(name: "Drama")
Genre.create!(name: "Biography")

users = User.all
user  = users.first

Book.create!(title: "Drach",
            synopsis: "Tako rzecze Drach",
            amount: 1,
            genre_id: 1,
            author: "Szczepan Twardoch")


99.times do |n|
  author  = Faker::Name.name
  title = "Leonard part #{n+1}"
  Book.create!(title: title,
              synopsis: "Yet another part of Leonard adventures",
              amount: 1,
              genre_id: 2,
              author: author)
end

Copy.create!(book_id: 1, edition: 1, ISBN: "temp", year_of_print: Time.zone.now.year)
Copy.create!(book_id: 1, edition: 1, ISBN: "temp", year_of_print: Time.zone.now.year)