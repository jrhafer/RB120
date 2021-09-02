class Player
  attr_accessor :move, :name

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      n = ''
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, must enter a value."
      end
      self.name = n
    else
      self.name = ['R2D2', "Hal", 'Chappie', 'Sonny', 'Number 5'].sample
    end

  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include? choice
        puts "Sorry, invalid choice."
      end
      self.move = choice
    elsif
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end
end

def human?
  @player_type == :human
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper Scissors!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "The #{computer.name} chose #{computer.move}."

    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "#{human.name} win!" if computer.move == 'scissors'
      puts "#{computer.name}r Won!" if computer.move == 'paper'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "A#{human.name} win!" if computer.move == 'paper'
      puts "#{computer.name} Won!" if computer.move == 'rock'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "#{human.name} win!" if computer.move == 'rock'
      puts "#{computer.name} Won!" if computer.move == 'scissors'
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    return true if answer == 'y'
    return false if answer == 'n'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play