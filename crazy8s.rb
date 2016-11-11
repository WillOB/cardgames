require './deck'
require './card'
require './scan'

deck = Deck.new
p1 = deck.cards[0..4]
p2 = deck.cards[5..9]
discard = [deck.cards[10]]
deck = deck.cards.drop(11)

while p1.length != 0 && p2.length != 0

faceUp = discard[0]

suit = faceUp.suit
rank = faceUp.rank

puts "Card is the #{rank} of #{suit}."
puts "You hand is: #{p1}"

matches = 0
p1.each do |x|
  cardSuit = p1[0].suit
  cardRank = p1[0].rank
  if cardRank == 8

  elsif suit = cardSuit || rank = cardRank
    matches += 1
  end

end

if matches == 1
  puts "You can play your"
elsif matches > 1
  print "Which will you play?"
  pick = scan
else
  puts "You cannot play anything. Draw a card."
  p1.push
end
end
