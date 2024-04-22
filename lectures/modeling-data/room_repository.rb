require_relative "room"

class RoomRepository
  def initialize(csv_file)
    @csv_file_path = csv_file
    @rooms = [] # => Array of Room INSTANCES
    load_csv
  end

  def all
    @rooms
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # row => {name: "Nicole", cured: "true"...}, 
      row[:id] = row[:id].to_i
      row[:capacity] = row[:capacity].to_i
      room = Room.new(row)
      @rooms << room
    end
  end
end