require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(room)
    @classroom = room
    @classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def disintegrate
    { 'id' => @id, 'name' => @name, 'age' => @age, 'parent_permission' => @parent_permission }
  end

end
