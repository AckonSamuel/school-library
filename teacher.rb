require './person'

class Teacher < Person
  def initialize(age, name, specilization, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specilization = specilization
  end

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    # rubocop:enable Naming/PredicateName
    true
  end
end
