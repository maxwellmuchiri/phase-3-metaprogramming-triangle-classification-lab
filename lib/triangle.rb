class Triangle
  attr_reader :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3].sort
    raise TriangleError if @sides.any? { |s| s <= 0 }
    raise TriangleError unless @sides[0] + @sides[1] > @sides[2]
  end

  def kind
    case @sides.uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    else        :scalene
    end
  end

  class TriangleError < StandardError
  end
end