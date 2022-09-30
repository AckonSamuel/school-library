require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom)
    super()
    @classroom = classroom
  end

  def classroom=(room)
    @classroom = room
    @classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
