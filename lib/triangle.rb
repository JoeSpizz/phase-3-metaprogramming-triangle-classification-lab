
class Triangle
  attr_reader :l1, :l2, :l3
  def initialize (l1, l2, l3)
    @l1=l1
    @l2=l2
    @l3=l3
  end

  def kind 
    confirm_triangle
    if l1 == l2 && l1==l3
      :equilateral
    elsif l1 == l2 && l2!=l3 || l1==l3 && l1!=l2 || l2 == l3 && l2!=l1
      :isosceles
    else
      :scalene
    end
  end

  def sides_OK?
    [l1,l2,l3].all?(&:positive?)
  end

  def is_valid_triangle?
    l1+l2>l3 && l2+l3>l1 && l1+l3>l2
  end

  def confirm_triangle
    raise TriangleError unless sides_OK? and is_valid_triangle?
  end

  class TriangleError < StandardError
    # triangle error code
  end

end
