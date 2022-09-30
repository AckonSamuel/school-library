
def main
    puts "Welcome to School Library App!"
    puts " "
    puts "Please choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - Exist"
    puts "Please enter your option below: "

    choice = gets.chomp.to_i
if (0..9).cover? choice

    case choice
    when 1
        p "List all books"
    when 2
        p "List all people"
    when 3
        p "Create a person"
    when 4
        p "Create a book"
    when 5
        p "Create a rental"
    when 6
        p "List all rentals for a given person id"
    when 7
        p "Exist"
    else
        p "wrong input"
    end
end
end

main