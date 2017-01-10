# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = City.create([
  {name: 'Carlsbad'},
  {name: 'Encinitas'},
  {name: 'Escondido'},
  {name: 'Fallbrook'},
  {name: 'Oceanside'},
  {name: 'San Marcos'},
  {name: 'Vista'}
])

if Rails.env == "development"
  admin = Admin.create( first_name: "Fake", last_name: "Roth",   email: "admin@email.com",  password: "password")

  faires = Faire.create([
    { title: "Village Faire",       description: "Village Faire Description",       city: cities[0], admin: admin},
    { title: "Street Faire",        description: "Street Faire Description",        city: cities[1], admin: admin},
    { title: "Strawberry Festival", description: "Strawberry Festival Description", city: cities[6], admin: admin}
  ])

  Event.create([
    {date: Date.today, faire: faires[0]},
    {date: Date.today + 1, faire: faires[1]},
    {date: Date.today + 2, faire: faires[1], alternate_title: "Fall Festival"}
  ])

  vendor = Vendor.create(first_name: "Fake", last_name: "Vendor", email: "vendor@email.com", password: "password")

  Business.create(business_name: "Tara's Treasures", product_description: "Homemade Crafts", street_address: "123 Main Street", city: "Anytown", state: "CA", zip: 12345, vendor: vendor)
end
