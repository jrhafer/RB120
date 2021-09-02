class GuessingGame
  attr_reader :winning_number
  attr_accessor :player_guess, :attempts

  def initialize
    @winning_number = (1..100).to_a.sample
    @player_guess = 0
    @attempts = 7
  end

  def player_guess_number
    loop do
      puts "You have #{attempts} guesses remaining."
      print "Choose a number between 1 and 100: "
      @player_guess = gets.chomp.to_i
      puts "guess is #{player_guess} and winning_number is #{winning_number}"
      break if (1..100).to_a.include?(@winning_number)
      puts "Invalid Guess."
    end
  end

  def space
    puts ''
  end

  def subtract_guess
    self.attempts -= 1
  end

  def display_result
    if player_guess == winning_number
      puts "That's the number!"
      space
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def >(other_number)
    player_guess > winning_number
  end

  def too_high_or_too_low
    if player_guess > winning_number
      puts "Your guess is too high."
    else
      puts "Your guess is too low."
    end
  end

  def play
    loop do
      player_guess_number
      subtract_guess
      break if player_guess == winning_number || attempts == 0
      too_high_or_too_low
    end
    display_result
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.
#
# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.
#
# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.
#
# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80
#
# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!
#
# You won!
#
# game.play
#
# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.
#
# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.
#
# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.
#
# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.
#
# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.
#
# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.
#
# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.
#
# You have no more guesses. You lost!
