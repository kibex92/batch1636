class Room
  attr_reader :name, :patients, :capacity, :id
  def initialize(attributes = {})
    # STATE
    # - capacity
    # - patients
    # - name
    # - wing

    @name = attributes[:name]
    @patients = attributes[:patients] || []
    @capacity = attributes[:capacity]
    @id = attributes[:id]
  end

  def full?
    @patients.size >= capacity
  end

  def add_patient(patient)
    if full?
      raise StandardError, "The room is full!"
    else
      @patients << patient
      patient.room = self
    end
  end
end