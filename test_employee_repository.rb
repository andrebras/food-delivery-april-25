require_relative 'app/repositories/employee_repository'

repo = EmployeeRepository.new('data/employees.csv')
repo.all.each { |e| p e }
