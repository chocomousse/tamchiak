User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

MenuItem.delete_all
MenuItem.create! id: 1, name: "Tomyam - Beef", cat: "Thai Kitchen", subcat: "Mee, Beehoon, Kwayteow, Maggie", item_code: "T30", price: 6.50 active: true
MenuItem.create! id: 2, name: "Tomyam - Chicken", cat: "Thai Kitchen", subcat: "Mee, Beehoon, Kwayteow, Maggie", item_code: "T30", price: 6.50 active: true
MenuItem.create! id: 3, name: "Tomyam - Seafood", cat: "Thai Kitchen", subcat: "Mee, Beehoon, Kwayteow, Maggie", item_code: "T30", price: 6.50 active: true

ChannelStatus.delete_all
ChannelStatus.create! id: 1, name: "Open"
ChannelStatus.create! id: 2, name: "Closed"