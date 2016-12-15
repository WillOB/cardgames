require './deck'
require './scan'
require './card'

deck = Deck.new.newDeck.shuffle
p1 = deck[0..25]
p2 = deck[26..51]

print "Enter player one's name: "
name1 = scan
print "Enter player two's name: "
name2 = scan

while p1.length > 0 && p2.length > 0

yourCard = p1[0]
otherCard = p2[0]


if yourCard == 11
  puts "#{name1}'s card is a Jack."
elsif yourCard == 12
  puts "#{name1}'s card is a Queen."
elsif yourCard == 13
  puts "#{name1}'s card is a King."
elsif yourCard == 1
  puts "#{name1}'s card is an Ace"
else
  puts "#{name1}'s card a #{yourCard.rank}."
end
if otherCard == 11
  puts "#{name2}'s card is a Jack."
elsif otherCard == 12
  puts "#{name2}'s card is a Queen."
elsif otherCard == 13
  puts "#{name2}'s card is a King."
else
puts "#{name2}'s card is a #{otherCard.rank}."
end

if yourCard.rank > otherCard.rank
  puts "#{name1} wins this draw."
  p1.push(yourCard).push(otherCard)
elsif otherCard.rank > yourCard.rank
  puts "#{name2} wins this draw."
  p2.push(otherCard).push(yourCard)
else
  puts "This means war!"
  if p1.length == 2
    p1 = []
    p2.push(p1[0]).push(p1[1]).push(p2[0])
    puts "#{name1} doesn't have enough cards for war."
  elsif p2.length == 2
    p2 = []
    p1.push(p2[0]).push(p2[1]).push(p1[0])
    puts "#{name2} doesn't have enough cards for war."
  elsif p1.length == 1
    p1 = []
    p2.push(p1[0]).push(p2[0])
  elsif p2.length == 1
    p2 = []
    p2.push(p2[0]).push(p1[0])
  else
  puts "#{name1}'s card is a #{p1[2].rank}."
  puts "#{name2}'s card is a #{p2[2].rank}."
  if p2[2].rank > p1[2].rank
    puts "#{name2} wins the war!"
    p2.push(otherCard).push(yourCard).push(p2[1]).push(p2[2]).push(p1[1]).push(p1[2])
    p1 = p1.drop(2)
    p2 = p2.drop(2)
  else
    puts "#{name1} wins the war!"
    p1.push(yourCard).push(otherCard).push(p1[1]).push(p1[2]).push(p2[1]).push(p2[2])
    p1 = p1.drop(2)
    p2 = p2.drop(2)
  end
  end

end

p1 = p1.drop(1)
p2 = p2.drop(1)
puts "#{name1} has #{p1.length} cards."
puts "#{name2} has #{p2.length} cards.\n\n"

end

if p2.length == 0
  puts "#{name1} wins!"
else
  puts "#{name2} wins!"
end
