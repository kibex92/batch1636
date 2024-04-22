require_relative 'patient'
require_relative 'room'


daniel = Patient.new(name: "Daniel")
juan = Patient.new(name: "Juan", cured: true)
nicole = Patient.new(name: "Nicole", cured: true)

swan = Room.new(name: "Swan", capacity: 4)

# puts "#{swan.name} has #{swan.patients.size} patients. Full? #{swan.full?}"

swan.add_patient(daniel)
swan.add_patient(juan)
swan.add_patient(nicole)

# puts "#{swan.name} has #{swan.patients.size} patients. Full? #{swan.full?}"

# begin
#   swan.add_patient(nicole)
# rescue StandardError
#   puts "Can't add #{nicole.name} to the room"
# end


p daniel.room.patients[2].room.patients.first.room.patients[1].room.name
  #<Room...   #<Patient Nicole #<Room     #<Patient Daniel <#Room #<Patient Juan #<Room Swan