class Patient
  attr_reader :name, :cured
  attr_accessor :room,  :id

  def initialize(attributes = {})
    # STATE
    # - name
    # - disease
    # - age
    # - blood_Type
    # - address
    # - emergency contact
    # - birthday
    # - cured
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @room = attributes[:room]
    @id = attributes[:id]
  end

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end
end
