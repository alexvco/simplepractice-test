# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


physicians = Physician.create!([{ first_name: 'Doc', last_name: 'jones' }, { first_name: 'Bob', last_name: 'Williams' }])
customers = Customer.create!([{ first_name: 'Alex', last_ame: 'test' , physician_id: physicians.first.id}, { first_name: 'Mike', last_ame: 'james', 
  physician_id: physicians.last.id }])
100.times do |i|
  appointments = Appointment.create!([{ customer_id: customers.first.id, physician_id: physicians.first.id, start_datetime: DateTime.parse('2020-09-15'), end_datetime: DateTime.parse('2020-09-16') }, 
  { customer_id: customers.last.id, physician_id: physicians.last.id, start_datetime: DateTime.parse('2020-09-17'), end_datetime: DateTime.parse('2020-09-18') }])
end