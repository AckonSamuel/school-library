require_relative 'choose'
require_relative 'options'

APP = App.new
OPTION = Option.new


class Main
  def display_menu # rubocop:disable Metrics/CyclomaticComplexity
    
    OPTION.option

    user_input = gets.chomp.to_i

    CHOOSE.callup(user_input)

    display_menu
  end
end

main = Main.new
main.display_menu
