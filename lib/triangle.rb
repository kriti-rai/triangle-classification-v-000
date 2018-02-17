require 'pry'
class Triangle
  attr_accessor :length_1, :length_2, :length_3

  def initialize(length_1, length_2, length_3)
    @length_1 = length_1
    @length_2 = length_2
    @length_3 = length_3
  end

  def valid?
    if (@length_1 > 0 && @length_2 > 0 && @length_3 > 0) && ((@length_1 + @length_2) > @length_3) && ((@length_1 + @length_3) > @length_2) && ((@length_2 + @length_3) > @length_1)
      true
    else
      false
    end

  end
    # binding.pry
  def kind
    if !valid?
      begin
        raise TriangleError.new
      rescue TriangleError => error
        puts error.message
      end

    elsif @length_1 == @length_2 && @length_2 == @length_3
      :equilateral
    elsif ((@length_1==@length_2)&& @length_1!= @length_3)||((@length_3 == @length_1) && @length_3 != @length_2)||((@length_2 == @length_3) && @length_2 != @length_1)
      :isosceles
    elsif @length_1!= @length_2 && @length_1!= @length_3 && @length_2!= @length_3
      :scalene
    end
  end
end

class TriangleError < StandardError
  def initialize
  end
  def message
    "It is not a valid triangle."
  end
end
