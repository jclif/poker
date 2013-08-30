# encoding: UTF-8
class Card
  attr_accessor :rank, :suit
  def initialize(rank, suit)
    @rank, @suit = rank, suit
  end

  def render
    case suit
    when "s" then uni = "♠"
    when "h" then uni = "♥"
    when "d" then uni = "♦"
    when "c" then uni = "♣"
    end
    value = rank

    if value > 10
      face = ["J", "Q", "K", "A"]
      value = face[value - 11]
    end

    "#{value}#{uni}"
  end
end
