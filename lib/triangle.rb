class Triangle
  attr_reader :sides

  def initialize(a, b, c)
    @sides = [a, b, c]
  end

  def negative_error
    sides.any? {|side| not side.positive?}
  end

  def length_error
    sides.any? {|side| 2*side >= sides.sum}
  end
  
  def invalid
    negative_error || length_error
  end

  def type_determiner
    case sides.uniq.count
    when 3
      :scalene
    when 2
      :isosceles
    when 1
      :equilateral
    end
  end

  def kind
    if invalid
      raise TriangleError
    else
      type_determiner
    end
  end

  class TriangleError < StandardError
  end
end