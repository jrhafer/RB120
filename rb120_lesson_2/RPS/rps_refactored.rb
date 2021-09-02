
module Possiblemoves
  class Scissors
    attr_accessor :value

    def initialize
      @value = 'scissors'
    end

    def wins(other)
      other.move.value == 'rock'
    end

    def wins(other)
      other.move.value == 'paper'
    end
  end

  class Rock
    attr_accessor :value

    def initialize
      @value = 'rock'
    end
  end

  class Paper
    attr_accessor :value

    def initialize
      @value = 'paper'
    end
  end
end

class Human
  attr_accessor :move

  def initialize
    @move = nil
  end

  def choose_move
    puts "Please enter a move:"
    choice = gets.chomp
    case choice
    when 'rock'
      self.move = Possiblemoves::Rock.new
    when 'paper'
      self.move = Possiblemoves::Paper.new
    when 'scissors'
      self.move = Possiblemoves::Scissors.new
    end
  end

  def hello
    puts 'hello'
  end
end

class Computer
  attr_accessor :move

  def initialize
    @move = nil
  end

  def choose_move
    choice = ['rock', 'paper', 'scissors'].sample
    case choice
    when 'rock'
      self.move = Possiblemoves::Rock.new
    when 'paper'
      self.move = Possiblemoves::Paper.new
    when 'scissors'
      self.move = Possiblemoves::Scissors.new
    end
  end
end

class Game
  attr_accessor :computer, :human

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  display_winner
    # if computer.move.wins(human.move)
    #   puts "The Computer wins the round!"
    if human.move.wins(other)
      puts "The Human wins the round!"
    else
      puts "It's a tie!"
    end
  end

  def play
    human.choose_move
    computer.choose_move
    # display_winner

  end



Game.new.play
