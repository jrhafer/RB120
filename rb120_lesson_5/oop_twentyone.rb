class Card
  SUITS = ['H', 'D', 'S', 'C']
  FACES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  SUIT_ABBREVIATIONS = {
    'H' => 'Hearts',
    'D' => 'Diamonds',
    'S' => 'Spades',
    'C' => 'Clubs'
  }

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end

  def suit
    SUIT_ABBREVIATIONS[@suit]
  end

  def ace?
    face == 'Ace'
  end

  def king?
    face == 'King'
  end

  def queen?
    face == 'Queen'
  end

  def jack?
    face == 'Jack'
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end

    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

module Hand
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    total_cards
    puts "=> Total: #{total}"
    puts ""
  end

  def reset_total
    self.total = 0
  end

  def tally_total
    reset_total
    cards.each do |card|
      card_face = card.face
      case card_face
      when 'Ace' then self.total += 11
      when 'King', 'Queen', 'Jack' then self.total += 10
      else self.total += card.face.to_i
      end
    end
  end

  def correct_for_aces
    cards.select(&:ace?).count.times do
      break if self.total <= 21
      self.total -= 10
    end
  end

  def total_cards
    tally_total
    correct_for_aces
  end

  def add_card(new_card)
    cards << new_card
  end

  def busted?
    total > 21
  end
end

class Participant
  include Hand

  attr_accessor :name, :cards, :total

  def initialize
    @cards = []
    @total = 0
    set_name
  end
end

class Player < Participant
  def set_name
    name = ''
    loop do
      puts "What's your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    self.name = name
  end

  def show_flop
    show_hand
  end
end

class Dealer < Participant
  ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def set_name
    self.name = ROBOTS.sample
  end

  def show_flop
    puts "---- #{name}'s Hand ----"
    puts cards.first.to_s
    puts " ?? "
    puts ""
  end
end

class TwentyOne
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def reset
    self.deck = Deck.new
    player.cards = []
    player.reset_total
    dealer.cards = []
    dealer.reset_total
  end

  def deal_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def player_hits_show_updated_hand
    player.add_card(deck.deal_one)
    puts "#{player.name} hits!"
    player.show_hand
  end

  def display_players_turn
    puts "#{player.name}'s turn..."
  end

  def prompt_player_hit_or_stay
    puts "Would you like to (h)it or (s)tay?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      puts "Sorry, must enter 'h' or 's'."
    end
    answer
  end

  def player_turn
    display_players_turn
    loop do
      answer = prompt_player_hit_or_stay
      if answer == 's'
        puts "#{player.name} stays!"
        break
      end
      player_hits_show_updated_hand
      break if player.busted?
    end
  end

  def display_dealers_turn
    puts "#{dealer.name}'s turn..."
  end

  def display_dealer_stays
    puts "#{dealer.name} stays!"
  end

  def display_dealer_hits
    puts "#{dealer.name} hits!"
  end

  def display_dealer_hits_and_deal_card
    display_dealer_hits
    dealer.add_card(deck.deal_one)
  end

  def dealer_turn
    display_dealers_turn
    loop do
      dealer.tally_total
      if dealer.total >= 17 && !dealer.busted?
        display_dealer_stays
        break
      end
      break if dealer.busted?
      display_dealer_hits_and_deal_card
    end
  end

  def show_busted
    if player.busted?
      puts "It looks like #{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      puts "It looks like #{dealer.name} busted! #{player.name} wins!"
    end
  end

  def show_cards
    player.show_hand
    dealer.show_hand
  end

  def show_result
    if player.total > dealer.total
      puts "It looks like #{player.name} wins!"
    elsif player.total < dealer.total
      puts "It looks like #{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y', 'n'].include? answer
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def set_card_table
    system 'clear'
    reset
    deal_cards
    show_flop
  end

  def display_cards_and_result
    show_cards
    show_result
  end

  def display_busted_if_player_busted
    show_busted if player.busted?
  end

  def display_busted_if_dealer_busted
    show_busted if dealer.busted?
  end

  def set_card_table_and_player_plays_hand
    set_card_table
    player_turn
    display_busted_if_player_busted
  end

  def dealer_plays_hand
    dealer_turn
    display_busted_if_dealer_busted
  end

  def dealer_and_player_play_twenty_one
    loop do
      set_card_table_and_player_plays_hand
      if player.busted? then play_again? ? next : break
      end
      dealer_plays_hand
      if dealer.busted? then play_again? ? next : break
      end
      display_cards_and_result
      break unless play_again?
    end
  end

  def start
    dealer_and_player_play_twenty_one
    puts "Thank you for playing Twenty-One. Goodbye!"
  end
end

game = TwentyOne.new
game.start
