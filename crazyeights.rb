require './deck'
require './card'
require './scan'


deck = Deck.new.newDeck.shuffle
player = deck[0..4]
computer = deck[5..9]
discard = [deck[10]]
deck = deck.drop(11)


def print_cards
  faceUp = discard[-1]
  suit = faceUp.suit
  rank = faceUp.rank

  puts "The card is the #{rank} of #{suit}."
  puts "Your cards are:"
  n = 1
  player.each do |card|
    puts "#{n}: #{card.rank} of #{card.suit}"
    n += 1
  end
end


def determine_matches(p_or_c)
  matches = 0
  p_or_c.each do |card|
    if card.rank == 8
      matches += 1
    elsif suit == card.suit || rank == card.rank
      matches += 1
    end
  end
  return matches
end


setup #create deck, give 5 cards from deck to each player, move one to discard
while player.length > 0 && computer.length > 0
  print_cards #prints all cards in player's hand and face-up card
  determine_matches(player) #makes sure there is a match
  while matches == 0
    draw_card(player)
    print_cards
    determine_matches
  end
  check_card #ask for card and make sure it works
  draw_card(player) #take top card from deck and add to bottom of player
  update #take card from player add to top of discard
  determine_matches(computer)
  pick_card
  draw_card(computer)
  update
end

if player.length == 0
  puts "You win!"
else
  puts "The computer wins."
end
