class GuessingGame
  def initialize
    @correct_number = rand(100)
    @remaining_guesses = 7
    @guess = nil
  end

  def play
    loop do
      display_remaining_guesses
      prompt_player_guess_number
      space
      player_guess_too_high_or_too_low
      adjust_remaining_guesses
      break if no_more_guesses_remaining || player_wins
    end
     display_outcome
  end

  private

  def space
    puts " "
  end

  def display_remaining_guesses
    puts "You have #{@remaining_guesses} guesses remaining."
  end

  def prompt_player_guess_number
    loop do
      print "Enter a number between 1 and 100: "
      @guess = gets.chomp.to_i
      break if validate?(@guess)
      print "Invalid guess."
    end
  end

  def player_wins
    @guess == @correct_number
  end

  def no_more_guesses_remaining
    @remaining_guesses < 0
  end

  def validate?(guess)
    (1..100).to_a.include?(guess)
  end

  def player_guess_too_high_or_too_low
    case @guess
    when 0...@correct_number then puts "Your guess is too low."
    when (@correct_number+1)..100 then puts "Your guess is too high."
    end
  end

  def adjust_remaining_guesses
    @remaining_guesses -= 1
  end

  def display_outcome
    if player_wins
      puts "That's the number!"
      space
      puts "You won!"
    else
      space
      puts "You have no more guesses. You lost!"
    end
  end
end

game = GuessingGame.new
game.play
