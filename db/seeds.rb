MenuItem.delete_all
MenuItem.create! id: 1, name: "Tomyam - Beef", cat: "Thai Kitchen", subcat: "Mee, Beehoon, Kwayteow, Maggie", item_code: "T30", price: 6.50, active: true
MenuItem.create! id: 2, name: "Tomyam - Chicken", cat: "Thai Kitchen", subcat: "Mee, Beehoon, Kwayteow, Maggie", item_code: "T30", price: 6.50, active: true
MenuItem.create! id: 3, name: "Tomyam - Seafood", cat: "Thai Kitchen", subcat: "Mee, Beehoon, Kwayteow, Maggie", item_code: "T30", price: 6.50, active: true

ChannelStatus.delete_all
ChannelStatus.create! id: 1, name: "Open"
ChannelStatus.create! id: 2, name: "Closed"