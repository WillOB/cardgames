require './deck'
require './card'
deck = Deck.new

newdeck = deck.newDeck
puts newdeck[0].rank
puts newdeck[0].suit
newdeck.each do |card|
  puts card.rank
  puts card.suit
end
