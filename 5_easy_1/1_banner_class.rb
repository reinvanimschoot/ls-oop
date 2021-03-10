=begin

Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
  end

  def empty_line
  end

  def message_line
    "| #{@message} |"
  end
end

Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

You may assume that the input will always fit in your terminal window.

Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

banner = Banner.new('')
puts banner
+--+
|  |
|  |
|  |
+--+

=end

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    spacer = "-" * message_length_padded
    "+#{spacer}+"
  end

  def empty_line
    spacer = " " * message_length_padded
    "|#{spacer}|"
  end

  def message_line
    "| #{@message} |"
  end

  private

  attr_reader :message

  def message_length_padded
    self.message.length + 2
  end
end

banner = Banner.new("To boldly go where no one has gone before.")
puts banner

banner = Banner.new("")
puts banner
