# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'
@name_array = ["lux","ekko",'lucian', "senna", "caitlin"]
puts "user 5 start"

5.times do |i|
u = User.create(
    first_name: @name_array[i],
    last_name: Faker::Name.last_name ,
    description: Faker::Lorem.paragraphs,   
    password: "tryandtry",
    email: "#{@name_array[i]}@yopmail.com",
    event_id: rand(1..15)
 )
end
 puts "Event 15 start"
 multiple_of_5 = [0,5,10,15,20,25,30,35,40,45,50,55,60]
 9.times do 
    e = Event.create(
        start_date: Time.now,
        duration: multiple_of_5.sample,
        title: Faker::University.name,
        description: Faker::Lorem.paragraphs,
        price: Faker::Number.between(from: 1, to: 100),
        location: Faker::Address.city,
        user_id: rand(1..5)
    )
end
puts "Attendance 15 start"
30.times do |i|
    puts i
    
    u_all = User.all.sample.id
    e_all = Event.all.sample.id
    a = Attendance.new(user_id: u_all, event_id: e_all)
    unless a.save
        u_all = User.all.sample.id
        e_all = Event.all.sample.id
    end
end


