require './deck'
require './card'
require './scan'

deck = Deck.new.newDeck
p1 = deck[0..4]
p2 = deck[5..9]
discard = [deck[10]]
deck = deck.drop(11)

while p1.length != 0 && p2.length != 0

faceUp = discard[0]

suit = faceUp.suit
rank = faceUp.rank

puts "The card is the #{rank} of #{suit}."
puts "Your cards are:"
num = 1
p1.each do |x|
  puts "#{num}: #{x.rank} of #{x.suit}"
  num += 1
end

matches = 0
p1.each do |x|
  if x.rank == 8
    matches += 1
  elsif suit == x.suit || rank == x.rank
    matches += 1
  end

end


if matches > 0
  print "Which card will you play?"
  pick = scan
else
  puts "You cannot play anything. Draw a card."
end

while pick < 1 || pick > 5
  #tell them no
if pickRank == 8
  #dostuff
elsif pickRank == rank || pickSuit == suit
  #do other stuff
else
  puts "Nuh uh! Pick another card."
end






end
