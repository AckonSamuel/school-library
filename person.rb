require './nameble.rb'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :age, :name

  attr_reader :id

  def can_use_services?
    is_of_age? == true || @parent_permission == true
  end

  def correct_name
    @name
end

  private

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    # rubocop:enable Naming/PredicateName
    @age >= 18
  end
end
