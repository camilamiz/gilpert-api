#frozen_string_literal: true

class CalculateMean
  attr_reader :number_set

  def initialize(number_set)
    @number_set = number_set
  end

  def execute
    (number_set.reduce(:+)/number_set.count).round(2)
  end
end
