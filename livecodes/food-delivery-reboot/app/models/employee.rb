class Employee
  attr_reader :id, :username, :password, :role
  # STATE
  # - username/email
  # - password
  # - role -> manager/rider
  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    @role == "manager" 
  end

  def rider?
    @role == "rider"
  end
end
