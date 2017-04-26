class BaseView
  def ask_for(label)
    puts "#{label.capitalize}?"
    print '> '
    gets.chomp
  end
end
