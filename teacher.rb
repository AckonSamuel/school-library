require './person.rb'

class Teacher < Person
    def initialize(specilization)
        super()
        @specilization = specilization
    end

    def is_of_age?
        true
    end
end
