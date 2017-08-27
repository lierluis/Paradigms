include Math

class Triangle
  def initialize(a,b,c)
    @a,@b,@c = a,b,c; swap
    @base, @height = 0.0,0.0
    @type; @valid; test
  end
  
  attr_accessor :a, :b, :c, :type
  
  def swap # have a < b < c
    if @c < @b then @c,@b = @b,@c end
    if @b < @a then @b,@a = @a,@b end
    if @c < @b then @c,@b = @b,@c end
  end
  
  # this method returns whether or not a triangle is valid
  def test
    # triangle inequality theorem
    if ( ((@a+@b)>@c) && ((@a+@c)>@b) && ((@b+@c)>@a) )
      if (@a==@b && @b==@c)
        @type = "equilateral"
        @base = @a
        @height = sqrt((@c**2) - (@a/2.0)**2) # pythagoras
      elsif ((@a*@a + @b*@b) == @c*@c)
        @type = "right"
        @base = @a
        @height = @b
      elsif (@a == @b) # smaller sides are equal
        @type = "isosceles"
        @base = @c # base is larger side
        @height = sqrt(@b**2 - (@c/2.0)**2)
      elsif (@b == @c) # larger sides are equal
        @type = "isosceles"
        @base = @a # base is smaller side
        @height = sqrt(@c**2 - @a**2)
      else
        @type = "scalene"
        @base = @c
        
        # simplified algebra used to find height of scalene
        x = (@a**2 + @c**2 - @b**2) / (2.0*@c)
        @height = sqrt(@a**2 - x**2)
        
      end
      @valid = true
    else
      @type = "not a triangle"
      @valid = false
    end
  end
  
  def perimeter
    if (test) then @a + @b + @c
    else -1 end
  end

  def area
    if (test) then 0.5 * @base * @height
    else -1 end
  end
end

### sample execution ###
tri = [Triangle.new(1,1,1), Triangle.new(3,4,5),
  Triangle.new(3,3,5), Triangle.new(1,5,5),
  Triangle.new(4,3,2), Triangle.new(1,1,5)]

for e in tri do
  print "#{e.type}: #{e.a}, #{e.b}, #{e.c}\n"
  print "area: #{e.area}\n"
  print "perimeter: #{e.perimeter}\n\n"
end

### output ###
# equilateral: 1, 1, 1
# area: 0.4330127018922193
# perimeter: 3

# right: 3, 4, 5
# area: 6.0
# perimeter: 12

# isosceles: 3, 3, 5      # base is large side
# area: 4.145780987944249
# perimeter: 11

# isosceles: 1, 5, 5      # base is small side
# area: 2.449489742783178
# perimeter: 11

# scalene: 2, 3, 4
# area: 2.9047375096555625
# perimeter: 9

# not a triangle: 1, 1, 5
# area: -1
# perimeter: -1
