require './deck'
require './card'
require './scan'

deck = Deck.new.newDeck.shuffle
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
n = 1
p1.each do |card|
  puts "#{n}: #{card.rank} of #{card.suit}"
  n += 1
end

matches = 0
p1.each do |card|
  if card.rank == 8
    matches += 1
  elsif suit == card.suit || rank == card.rank
    matches += 1
  end
end

while matches == 0
  puts "You cannot play anything. Draw a card."
  p1.push()
end

print "Which card will you play? >"
pick = scan.to_i

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
  p1.delete_at(pick - 1)
  num += 1
  p1.push(deck[num])
elsif pickRank == rank || pickSuit == suit
  discard.push(Card.new(pickRank, pickSuit))
  p1.delete_at(pick - 1)
  num += 1
  p1.push(deck[num])
end

matches2 = 0
p2.each do |card|
  if card.rank == 8
    matches2 += 1
  elsif suit == card.suit || rank == card.rank
    matches2 += 1
  end
end

if matches2 > 0
  #do stuff
else
  puts "Computer draws a card."
end
end
