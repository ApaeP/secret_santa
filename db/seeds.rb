puts "\n \n "
puts "==============================================================="
puts "                         START SEEDING                         "
puts "===============================================================\n \n "

puts "    --------------------------------"
puts "           CLEANING DATABASE\n "
  puts "            - Deleting pool(s)"
    Pool.destroy_all
  puts "            - Deleting user(s)"
    User.destroy_all
puts "\n            DATABASE CLEANED"
puts "    --------------------------------\n \n "

puts "    --------------------------------"
puts "           SEEDING DATABASE\n "

  puts "            - Create user(s)"
    main_user = User.create!(email: "test@test.com", password: "azerty", first_name: "John", last_name: "Doe")

  puts "            - Create pool(s)"
    pool_1 = Pool.create!(user: main_user, name: "Noël 2020")
    pool_2 = Pool.create!(user: main_user, name: "Noël 2021")

  puts "            - Create participant(s)"
    10.times do
      tfn = Faker::Name.first_name
      tln = Faker::Name.last_name
      Participant.create!(
        pool: pool_1,
        first_name: tfn,
        last_name: tln,
        email: "#{tfn.downcase}.#{tln.downcase}@test.com")
    end

  # puts "            - Create draw(s)"
  #   2.times do
  #     Draw.create!(
  #       pool: pool_1)
  #   end

  # puts "            - Create gifter(s) & receiver(s)"
  #   Draw.last.pool.participants.each do |participant|
  #     Gifter.create!(draw: Draw.last, participant: participant)
  #     Receiver.create(draw: Draw.last, participant: participant)
  #   end

puts "\n            DATABASE SEEDED"
puts "    --------------------------------\n \n "

puts "==============================================================="
puts "                         SEEDING ENDED                         "
puts "===============================================================\n \n "
