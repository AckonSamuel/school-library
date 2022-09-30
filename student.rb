require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def classroom(room = @classroom)
    room.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
