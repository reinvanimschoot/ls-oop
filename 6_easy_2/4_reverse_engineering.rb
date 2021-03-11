=begin

Write a class that will display:

ABC
xyz

when the following code is run:

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

=end

class Transform
  attr_reader :value

  def self.lowercase(value)
    value.downcase
  end

  def initialize(value)
    @value = value
  end

  def uppercase
    value.upcase
  end
end

my_data = Transform.new("abc")
puts my_data.uppercase
puts Transform.lowercase("XYZ")
