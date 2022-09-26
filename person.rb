class Person
    def initialize(name  = "Unknown", age, parent_permission = true )
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    end

    attr_accessor :age, :name

    attr_reader :id

    def can_use_services?
        @parent_permission = parent_permission
        is_of_age? == true || @parent_permission == true
    end

    private

    def is_of_age?
        @age >= 18
    end

end