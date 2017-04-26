class Router
  def initialize(meals_controller, sessions_controller)
    @meals_controller = meals_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    employee = @sessions_controller.sign_in

    while @running
      if employee.role == 'manager'
        display_manager_options
        action = gets.chomp
        route_manager_action(action)
      else
        display_delivery_guy_options
        action = gets.chomp
        route_delivery_guy_action(action)
      end
    end
  end

  def route_manager_action(action)
    case action
    when '1' then @meals_controller.list
    when '2' then @meals_controller.create
    when '3', 'exit', 'stop', 'clear'
      stop
    end
  end

  def route_delivery_guy_action(action)
    case action
    when '1' then puts "TODO list my orders"
    when '2' then puts "TODO mark as delivered"
    when '3', 'exit', 'stop', 'clear'
      stop
    end
  end

  def display_manager_options
    puts '1 - List Meals'
    puts '2 - Add Meals'
    puts '3 - Exit Program'
    print '> '
  end

  def display_delivery_guy_options
    puts '1 - List my orders'
    puts '2 - Mark as delivered'
    puts '3 - Exit Program'
    print '> '
  end

  def stop
    @running = false
  end
end
