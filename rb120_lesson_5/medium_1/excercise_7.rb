class GuessingGame
  def initialize(min_num, max_num)
    @guess_range = (min_num..max_num)
    @correct_number = rand(@guess_range)
    @remaining_guesses = Math.log2(max_num - min_num).to_i + 1
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

  def display_guess_range
    "#{@guess_range.begin} to #{@guess_range.end}"
  end

  def space
    puts " "
  end

  def display_remaining_guesses
    puts "You have #{@remaining_guesses} guesses remaining."
  end

  def prompt_player_guess_number
    loop do
      print "Enter a number between #{display_guess_range}: "
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
    @guess_range.to_a.include?(guess)
  end

  def player_guess_too_high_or_too_low
    case @guess
    when @guess_range.begin...@correct_number then puts "Your guess is too low."
    when (@correct_number+1)..@guess_range.end then puts "Your guess is too high."
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

game = GuessingGame.new(501, 1500)
game.play