class Deck
  attr_accessor :cards

  def initialize
    fill_deck
  end

  def fill_deck
    @cards = []
    ['h', 'd', 's', 'c'].each do |suit|
      (2..14).to_a.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end

  def draw
    @cards.shift
  end
end