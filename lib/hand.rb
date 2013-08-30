require 'debugger';#debugger

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
    cards.sort_by! { |card| card.rank }.reverse!
    flush = cards.all? { |card| card.suit == cards[0].suit }

    card_ranks = cards.map { |card| card.rank }
    straight = straights.include?(card_ranks)



    counts = Hash.new(0)
    card_ranks.each do |rank|
      counts[rank] += 1
    end

    four = counts.key(4)

    three = counts.key(3)

    two = []
    counts.each { |rank, count| two << rank if count == 2 }

    if flush && straight
      type = :straightflush
    elsif flush
      type = :flush
    elsif straight
      type = :straight
      if cards[0].rank == 14
        cards << cards.shift
      end
    elsif four
      type = :fourkind
      move_cards(four)
    elsif three && two.length == 1
      type = :house
      move_cards(three)
      move_cards(two)
    elsif three
      type = :threekind
      move_cards(three)
    elsif two.length == 2
      type = :twopair
      move_cards(two[0])
      move_cards(two[1])
    elsif two.length == 1
      type = :pair
      move_cards(two[0])
    else
      type = :highcard
    end

    return [type, cards]
  end

  def move_cards(target_rank)
    type_cards = []

    cards.each do |card|
      if card.rank == target_rank
        type_cards.unshift(card)
      else
        type_cards << card
      end
    end

    self.cards = type_cards
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