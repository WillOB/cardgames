require './deck'
require './card'
deck = Deck.new

newdeck = deck.newDeck.shuffle
puts newdeck[0].rank
