=begin

What will the following code print?

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

=end

class Something
  def initialize
    @data = "Hello"
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    "ByeBye"
  end
end

# thing = Something.new

# puts Something.dupdata
# We are using the class method here so this will print out "ByeBye"

# puts thing.dupdata
# We are using the instance method here so this will print out "HelloHello"
