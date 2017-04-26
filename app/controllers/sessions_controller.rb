require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @repo = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # 1. ask username
    username = @view.ask_for(:username)
    # 2. ask password
    password = @view.ask_for(:password)
    # 3. find username
    employee = @repo.find_by_username(username)
    # 4. match password
    if employee && employee.password == password
      @view.signed_in_as(employee)
      return employee
    else
      @view.wrong_credentials
      sign_in # Recursive call
    end
  end
end
