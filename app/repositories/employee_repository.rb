require 'pry-byebug'
require_relative 'base_repository'
require_relative '../models/employee'

class EmployeeRepository < BaseRepository
  def build_row_header
    ['id', 'username', 'password', 'role']
  end

  def find_by_username(username)
    @elements.find { |employee| employee.username == username }
  end

  def build_instance(row)
    employee_attributes = {
      id: row[:id].to_i,
      username: row[:username],
      password: row[:password],
      role: row[:role]
    }

    Employee.new(employee_attributes)
  end
end
