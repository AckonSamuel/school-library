require_relative 'choose'
require_relative 'options'

CHOOSE = Choose.new
OPTION = Option.new

class Main
  def display_menu
    OPTION.option

    user_input = gets.chomp.to_i

    CHOOSE.callup(user_input)

    display_menu
  end
end

main = Main.new
main.display_menu
