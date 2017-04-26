require_relative 'base_view'

class SessionsView < BaseView
  def signed_in_as(employee)
    puts "Hi, #{employee.username} | #{employee.role}"
  end

  def wrong_credentials
    puts "Wrong credentials!"
  end
end
