class Hand
  attr_accessor :cards, :deck

  def initialize(deck)
    @cards = []
    @deck = deck
    draw_card(5)
  end

  def draw_card(num)
    num.times do
      cards << deck.draw
    end
  end

  def type
    #start greater value
    # check flush, straight
    cards.sort_by! { |card| card.rank }.reverse
    flush = cards.all? { |card| card.suit == cards[0].suit }

    card_ranks = cards.map { |card| card.rank }.reverse
    straight = straights.include?(card_ranks)

    if flush && straight
      return [:straightflush, cards]
    elsif flush
      return [:flush, cards]
    elsif straight
      return [:straight, cards]
    end
  end

  def straights
    (2..10).to_a.map do |start|
      array = []
      5.times do |diff|
        array << start + diff
      end
      array.reverse
    end << [14, 5, 4, 3, 2]
  end

end