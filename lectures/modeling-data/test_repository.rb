require_relative "patient_repository"
require_relative "room_repository"



require_relative 'patient'

miroslav = Patient.new(name: "Miroslav")
sonja = Patient.new(name: "Sonja")


room_repo = RoomRepository.new("rooms.csv")
patient_repo = PatientRepository.new("patients.csv", room_repo)

patient_repo.create(miroslav)
patient_repo.create(sonja)
p patient_repo.all