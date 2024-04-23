require_relative "../views/sessions_view"

class SessionsController
  # STATE
  # - employee_repo
  # - SessionsView
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def login
    # 1. Ask a user for username
    username = @view.ask_user_for("username")
    # 2. Ask user for password
    password = @view.ask_user_for("password")
    # 3. Find an employee with the username
    employee = @employee_repository.find_by_username(username)
    # 4. Check if the passwords are matching
    if employee
      if employee.password == password
        return employee
      else
        @view.wrong_credentials
        login
      end
    else
      @view.wrong_credentials
      login
    end
    # If yes -> Succesfully logged in message
    # if not -> Wrong credentials message
  end
end