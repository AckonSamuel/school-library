require_relative 'app'
require_relative 'options'

APP = App.new
OPTION = Option.new


class Main
  def display_menu # rubocop:disable Metrics/CyclomaticComplexity
    OPTION.option
    user_input = gets.chomp.to_i
    case option
    when 1
      APP.list_books
    when 2
      APP.list_people
    when 3
      APP.create_person
    when 4
      APP.create_book
    when 5
      APP.create_rental
    when 6
      APP.list_rentals_by_person_id
    when 7
      puts 'Thank you for using this app!'
      exit
    else puts 'Invalid option' end
    display_menu
  end
end

main = Main.new
main.display_menu
