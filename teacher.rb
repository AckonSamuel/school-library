require './person'

class Teacher < Person
  def initialize(specilization)
    super()
    @specilization = specilization
  end

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    # rubocop:enable Naming/PredicateName
    true
  end
end
