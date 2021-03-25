# frozen_string_literal: true

# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create admin --------------------------------------
User.find_or_create_by(email: 'admin@bigpetco.com', role: :admin) do |u|
  u.name = 'Bigpet admin'
  u.password = '0987654321.'
  u.phone = 2_009_090
end

User.find_or_create_by(email: 'salesmanager@bigpetco.com', role: :admin) do |u|
  u.name = 'Sales manager'
  u.password = '1234509876.'
  u.phone = 3_999_090
end

# Create Resources ----------------------------------
# User.find_or_create_by(email: 'customer@bigpetco.com', role: :customer) do |u|
#   u.name = 'customer bigpet1'
#   u.password = '12345678.'
#   u.phone = 2_009_090
#   u.address = 'Cra big 12 - 34'
# end

# User.find_or_create_by(email: 'customer1@bigpetco.com', role: :customer) do |u|
#   u.name = 'customer bigpet2'
#   u.password = '12345678.'
#   u.phone = 2_009_090
#   u.address = 'Cra big 12 - 44'
# end

# Leed.find_or_create_by(email: 'leed1@bigpetco.com', name: 'leed one')

# Leed.find_or_create_by(email: 'leed2@bigpetco.com', name: 'leed two')
