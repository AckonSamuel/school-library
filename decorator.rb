require './nameable'

class Decorator < Nameable
  # rubocop:disable Lint/MissingSuper
  def initialize(nameable)
    @nameable = nameable
  end
  # rubocop:enable Lint/MissingSuper

  attr_accessor :nameable

  def correct_name
    @nameable.correct_name
  end
end
