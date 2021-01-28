require 'pry'

class Triangle
  attr_accessor :side_1, :side_2, :side_3
  
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def illegal_length?
    x = @side_1 <= 0 || @side_2 <= 0 || @side_3 <= 0 ? true : false
    y = @side_1 + @side_2 <= @side_3 || @side_3 + @side_2 <= @side_1 || @side_1 + @side_3 <= @side_2 ? true : false
    x || y ? true : false
  end

  def kind
    # binding.pry
    if illegal_length?
        raise TriangleError
    elsif @side_1 == @side_2 && @side_1 == @side_3
      return :equilateral
    elsif @side_1 == @side_2 || @side_1 == @side_3 || @side_2 == @side_3
      return :isosceles
    elsif @side_1 != @side_2 && @side_1 != @side_3 && @side_2 != @side_3
      return :scalene
    end

  end
  
  class TriangleError < StandardError
  end
  
end
