
require_relative 'app'
APP = App.new

class Choose

    def initialize
        @option = '';
    end

    def callup(option)
        @option = option
        case @option
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
    end
end