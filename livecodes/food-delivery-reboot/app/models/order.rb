class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee
  
  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal] # => instance of Meal
    @customer = attributes[:customer] # => instance of Customer
    @employee = attributes[:employee] # => instance of Employee
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end