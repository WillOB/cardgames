require './deck'
require './card'
require './scan'


deck = Deck.new.newDeck.shuffle
player = deck[0..4]
computer = deck[5..9]
discard = [deck[10]]
deck = deck.drop(11)


def print_cards(suit, rank, cards)  #prints all cards in player's hand and face-up card
  puts "The card is the #{rank} of #{suit}."
  puts "Your cards are:"
  n = 1
  cards.each do |card|
    puts "#{n}: #{card.rank} of #{card.suit}"
    n += 1
  end
end


def matches(p_or_c, suit, rank) #determines number of matches computer or player has in their hand
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


def draw_card(p_or_c, deck) #takes top card from deck and add to bottom of player's or computer's deck
  p_or_c.push(deck[0])
  if p_or_c == "player"
    puts "You drew the #{deck[0].rank} of #{deck[0].suit}."
  end
  deck.drop(1)
end


def ask_card(player, suit, rank)  #asks for card and make sure it works, return which card is selected
  print "Which card will you play? >"
  pick = scan.to_i - 1

  while pick < 0 || pick > player.length - 1
    print "Please enter the number of the card you want to play. >"
    pick = scan.to_i
  end

  pickSuit = player[pick].suit
  pickRank = player[pick].rank


  while !(pickRank == rank || pickSuit == suit || pickRank == 8)
      print "You can't play that card! Pick another. >"
      pick = scan.to_i - 1
      pickSuit = player[pick].suit
      pickRank = player[pick].rank
      while pick < 0 || pick > player.length - 1
        print "Please enter the number of the card you want to play. >"
        pick = scan.to_i - 1
      end
  end

  puts "You played the #{pickRank} of #{pickSuit}."
  return pick
end


def update(p_or_c, pick, discard) #take card from player add to top of discard
  discard.push(p_or_c[pick])
  p_or_c.delete_at(pick)
end


def pick_card(matches, computer, suit, rank)  #picks the card the computer will play
  pick = -1
  num = 0
     while pick == -1
       computer.each do |card|
         if card.rank == 8 || card.rank == rank || card.suit == suit
           pick = num
         end
         num += 1
       end
    end

  puts "\nThe computer took its turn."
  return pick
end


while player.length > 0 && computer.length > 0
  while deck.length > 0
    suit = discard[-1].suit
    rank = discard[-1].rank
    if discard[-1].rank == 8
      n = rand(4)
      if n == 1
        suit = "spades"
      elsif n == 2
        suit = "clubs"
      elsif n == 3
        suit = "hearts"
      else
        suit = "diamonds"
      end
    end
    print_cards(suit, rank, player)
    while matches(player, suit, rank) == 0
      draw_card(player, deck)
      print_cards(suit, rank, player)
      #matches(player, suit, rank)
    end
    update(player, ask_card(player, suit, rank), discard)
    rank = discard[-1].rank
    if rank == 8
      print "Which suit should your opponent play? >"
      suit = scan.to_s.downcase
    else
      suit = discard[-1].suit
    end
    matches = matches(computer, suit, rank)
    while matches == 0
      draw_card(computer, deck)
      #matches(computer, suit, rank)
    end
    pick = pick_card(matches, computer, suit, rank)
    update(computer, pick, discard)
  end
  faceUp = discard[-1]
  discard.delete_at[-1]
  deck = discard.shuffle
  discard = [faceUp]
end

if player.length == 0
  puts "You win!"
else
  puts "The computer wins."
end
