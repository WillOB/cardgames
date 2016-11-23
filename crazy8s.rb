require './deck'
require './card'
require './scan'

deck = Deck.new.newDeck
p1 = deck[0..4]
p2 = deck[5..9]
discard = [deck[10]]
deck = deck.drop(11)
num = 10

while p1.length != 0 && p2.length != 0

faceUp = discard[-1]

suit = faceUp.suit
rank = faceUp.rank

puts "The card is the #{rank} of #{suit}."
puts "Your cards are:"
num = 1
p1.each do |card|
  puts "#{num}: #{card.rank} of #{card.suit}"
  num += 1
end

matches = 0
p1.each do |card|
  if card.rank == 8
    matches += 1
  elsif suit == card.suit || rank == card.rank
    matches += 1
  end
end

if matches > 0
  print "Which card will you play? >"
  pick = scan.to_i
else
  puts "You cannot play anything. Draw a card."
end

while pick < 1 || pick > 5
  print "Please enter the number of the card you want to play. >"
  pick = scan.to_i
end

pickRank = p1[pick - 1].rank
pickSuit = p1[pick - 1].suit

while !(pickRank == rank || pickSuit == suit || pickRank == 8)
    print "You can't play that card! Pick another. >"
    pick = scan.to_i
    pickRank = p1[pick - 1].rank
    pickSuit = p1[pick - 1].suit
end

if pickRank == 8
  print "Pick a new suit. > "
  newSuit = scan.downcase!
  discard.push(Card.new(pickRank, pickSuit))
  p1.delete_at(pick-1)
  num += 1
  p1.push(deck[num])
elsif pickRank == rank || pickSuit == suit
  discard.push(Card.new(pickRank, pickSuit))
  p1.delete_at(pick-1)
  num += 1
  p1.push(deck[num])
end


end
