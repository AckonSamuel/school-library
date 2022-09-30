
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
        puts "List all books"
    when 2
        puts "List all people"
    when 3
        create_person
    when 4
        puts "Create a book"
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

def create_person
    age = 0
    name = ""
    permitt = ""
    puts "Do you want to create a student (1) or a teacher (2)? [Input the number]"
        user_input = gets.chomp.to_i
        if (1..2).cover? user_input
            puts "Age: "
            age = gets.chomp.to_i
            puts "Name: "
            name = gets.chomp
            case user_input
            when 1
            puts "Has parent permission? [Y/N]: "
            permitt = gets.chomp
            permitt == 'y' || 'Y' || 'n' || 'N' ? permitt : permitt = nil
            when 2
                puts "Specialization"
                spec = gets.chomp
            else
                nil
            end
            puts "person created successfully"
        end
end

main