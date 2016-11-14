require './card'
class Deck

  attr_accessor :order

  def initialize()
    @order = []
  end

  def newDeck
    number = 1
    52.times do
      if number % 13 == 0
        rank = 13
      else
        rank = number % 13
      end
      if number >= 1 && number < 14
        suit = "Hearts"
      elsif number >= 14 && number < 27
        suit = "Diamonds"
      elsif number >= 27 && number < 40
        suit = "Spades"
      else
        suit = "Clubs"
      end
      #
      order.push(Card.new(rank, suit))
      number += 1
    end
    return order.shuffle
  end

#  def cards
#    return order
#  end

#  def shuffle
#    order.shuffle
#    return order
#  end

end
