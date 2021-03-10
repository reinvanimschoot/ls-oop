=begin

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

=end

# Answer

=begin

Since there is a destructive method being called on @name on line 11, the instance variable @name will
from that moment on be uppercased.

The solution here is to remove the bang that appends the method call so we call the non-destructive version of the method.

=end
