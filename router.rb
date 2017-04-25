class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    @running = true
  end

  def run
    while @running
      display_options
      action = gets.chomp
      run_action(action)
    end
  end

  def run_action(action)
    case action
    when '1' then @meals_controller.list
    when '2' then @meals_controller.create
    when '3', 'exit', 'stop', 'clear'
      stop
    end
  end

  def stop
    @running = false
  end

  def display_options
    puts '1 - List Meals'
    puts '2 - Add Meals'
    puts '3 - Edit Program'
  end
end