# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'colorize'

# INIT
nb_city = 20
nb_dog = 50
nb_sitters = 50
nb_stroll = 100
nb_dog_strolls = 200

count_dog_strolls = 0
count_strolls = 0
count_dog_sitters = 0
count_cities = 0
count_dogs = 0

# CITIES
nb_city.times do
  city = City.create(name: Faker::Address.city)

  count_cities += 1 unless city.nil?
end

# Confirm seed it's OK
if count_cities == nb_city
  puts '   City:             '.green + "#{count_cities}/#{nb_city}".green + '   ont été créées !'.green
else
  puts '   City:             '.red + "#{count_cities}/#{nb_city}".red + '   ont été créé   !'.red
end

# DOGS
nb_dog.times do
  dog = Dog.create(
    name: Faker::Name.first_name,
    city_id: Faker::Number.between(from: 0, to: nb_city - 1)
  )

  count_dogs += 1 unless dog.nil?
end

# Confirm seed it's OK
if count_dogs == nb_dog
  puts '   Dog:              '.green + "#{count_dogs}/#{nb_dog}".green + '   ont été créés  !'.green
else
  puts '   Dog:              '.red + "#{count_dogs}/#{nb_dog}".red + '   ont été créé   !'.red
end

# DOG_SITTERS
nb_sitters.times do
  sitter = DogSitter.create(
    name: Faker::Name.name,
    city_id: Faker::Number.between(from: 0, to: nb_city - 1)
  )

  count_dog_sitters += 1 unless sitter.nil?
end

# Confirm seed it's OK
if count_dog_sitters == nb_sitters
  puts '   Dog_sitter:       '.green + "#{count_dog_sitters}/#{nb_sitters}".green + '   ont été créés  !'.green
else
  puts '   Dog_sitter:       '.red + "#{count_dog_sitters}/#{nb_sitters}".red + '   ont été créé   !'.red
end

# STROLLS
t1 = Time.parse('2020-07-29 00:00:00')
t2 = Time.parse('2021-01-01 23:59:59')
nb_stroll.times do
  stroll = Stroll.create(
    date: rand(t1..t2),
    dog_sitter_id: Faker::Number.between(from: 0, to: nb_sitters - 1),
    city_id: Faker::Number.between(from: 0, to: nb_city - 1)
  )

  count_strolls += 1 unless stroll.nil?
end

# Confirm seed it's OK
if count_strolls == nb_stroll
  puts '   Stroll:          '.green + "#{count_strolls}/#{nb_stroll}".green + '  ont été créées !'.green
else
  puts '   Stroll:          '.red + "#{count_strolls}/#{nb_stroll}".red + '  ont été créée !'.red
end

# JOIN_DOG_STROLLS
nb_dog_strolls.times do
  dog_strolls = DogStroll.create(
    stroll_id: Faker::Number.between(from: 0, to: nb_stroll - 1),
    dog_id: Faker::Number.between(from: 0, to: nb_dog - 1)
  )

  count_dog_strolls += 1 unless dog_strolls.nil?
end

# Confirm seed it's OK
if count_dog_strolls == nb_dog_strolls
  puts '   Dog_stroll:      '.green + "#{count_dog_strolls}/#{nb_dog_strolls}".green + '  ont été créées !'.green
else
  puts '   Dog_stroll:      '.red + "#{count_dog_strolls}/#{nb_dog_strolls}".red + '  ont été créée !'.red
end
