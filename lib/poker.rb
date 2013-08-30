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
    # -1 lose, 1 win, 0 draw
  end
end
