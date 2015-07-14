Item.delete_all
Item.create! id: 1, item_code: "T30", name: "Tomyam - Beef", price: 6.50, cat: "THAI KITCHEN", subcat: "Mee, Beehoon, Kwayteow, Maggie"
Item.create! id: 2, item_code: "T30", name: "Tomyam - Chicken", price: 6.50, cat: "THAI KITCHEN", subcat: "Mee, Beehoon, Kwayteow, Maggie"
Item.create! id: 3, item_code: "T30", name: "Tomyam - Seafood", price: 6.50, cat: "THAI KITCHEN", subcat: "Mee, Beehoon, Kwayteow, Maggie"

ChannelStatus.delete_all
ChannelStatus.create! id: 1, name: "Open"
ChannelStatus.create! id: 2, name: "Closed"