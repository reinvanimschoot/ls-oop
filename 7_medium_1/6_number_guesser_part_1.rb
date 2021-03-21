=begin

Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!

Note that a game object should start a new game with a new number to guess with each call to #play.

=end

class GuessingGame

  def initialize
    @correct_number = (1..100).to_a.sample
    @guesses_remaining = 7
  end

  def play
    loop do
      display_guesses_remaining
      guess = ask_for_number
      handle_guess(guess)

      break display_goodbye_message(won: true) if correct_guess?(guess)
      break display_goodbye_message(won: false) if out_of_guesses?
    end
  end

  private
    attr_reader :correct_number, :guesses_remaining

  def display_guesses_remaining
    puts "You have #{guesses_remaining} guesses remaining."
  end

  def ask_for_number
    loop do
      puts "Enter a number between 1 and 100: "
      guess = gets.chomp.to_i

      break guess if guess <= 100
      puts "Invalid guess."
    end
  end

  def handle_guess(guess)
    if guess < correct_number
      puts "Your guess is too low."
    elsif guess > correct_number
      puts "Your guess is too high."
    else
      puts "That's the number!"
    end

    @guesses_remaining -= 1
  end

  def display_goodbye_message(won:)
    if won
      puts " You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def correct_guess?(guess)
    guess == correct_number
  end

  def out_of_guesses?
    guesses_remaining.zero?
  end
end

game = GuessingGame.new
game.play