require './player.rb'
require './deck.rb'
require './hand.rb'
require './card.rb'

class Poker
  HEIRARCHY = [:highcard, :pair, :twopair, :threekind, :straight, :flush, :house, :fourkind, :straightflush]

  def initialize
    @players = [Player.new, Player.new]
  end

  def play
  end

  def beats?(first_hand, second_hand)
    first_type = first_hand.type
    second_type = second_hand.type
    first_value = HEIRARCHY.index(first_type[0])
    second_value = HEIRARCHY.index(second_type[0])

    state = first_value > second_value ? 1 : -1
    # -1 lose, 1 win, 0 draw

    state
  end
end
