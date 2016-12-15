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
        suit = "hearts"
      elsif number >= 14 && number < 27
        suit = "diamonds"
      elsif number >= 27 && number < 40
        suit = "spades"
      else
        suit = "clubs"
      end
      #
      @order.push(Card.new(rank, suit))
      number += 1
    end
    return @order
  end

  def shuffle
    return @order.shuffle
  end

end
