require 'csv'
require_relative 'patient'

class PatientRepository
  def initialize(csv_file, room_repository)
    @csv_file_path = csv_file
    @room_repository = room_repository
    @next_id = 1
    @patients = [] # => Array of Patient INSTANCES
    load_csv
  end

  def all
    @patients
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    # save_csv
  end

  def load_csv
    # CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
    #   # row => {name: "Nicole", cured: "true"...}, 
    #   row[:id] = row[:id].to_i
    #   row[:cured] = row[:cured] == "true"

    #   room_id = row[:room_id].to_i
    #   room = @room_repository.find(room_id)
      
    #   patient = Patient.new(row)
    #   patient.room = room
    #   @patients << patient
    #   room.add_patient(patient)
    # end
    # @next_id = @patients.last.id + 1 if @patients.any?
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:cured] = row[:cured] == "true"
      row[:id] = row[:id].to_i

      patient = Patient.new(row)
      @patients << patient
    end
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id", "name", "cured"]
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured]
      end
    end
  end
end

