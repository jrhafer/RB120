class Card
  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    case rank
    when "Jack" then 10.1
    when 'Queen' then 10.2
    when 'King' then 10.3
    when 'Ace' then 11
    else rank
    end
  end

  def <=>(other)
    value <=> other.value
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :cards

  def initialize
    reset
  end

  def reset
    @cards = []
    if @cards.empty?
      RANKS.each do |rank|
        SUITS.each do |suit|
          @cards << Card.new(rank, suit)
        end
      end
    end
    @cards.shuffle!
  end

  def draw
    unless @cards.empty?
      @cards.pop
    else
      reset
      @cards.pop
    end
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.
