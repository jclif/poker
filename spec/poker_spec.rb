require 'poker.rb'

describe Poker do
  subject(:poker) { Poker.new }
  let(:deck) { Deck.new}
  let(:hand1) { Hand.new(deck) }
  let(:hand2) { Hand.new(deck) }

  describe "#beats?" do
    it "returns -1 pair vs higher pair" do
      hand1.cards = [Card.new(2,"d"),
                     Card.new(2,"d"),
                     Card.new(3,"d"),
                     Card.new(5,"h"),
                     Card.new(9,"d"),]
      hand2.cards = [Card.new(3,"d"),
                     Card.new(3,"d"),
                     Card.new(4,"d"),
                     Card.new(5,"h"),
                     Card.new(9,"d"),]
      expect(poker.beats?(hand1, hand2)).to eq(-1)
    end

    it "returns -1 pair vs pair with A" do
      hand1.cards = [Card.new(2,"d"),
                     Card.new(3,"d"),
                     Card.new(3,"d"),
                     Card.new(5,"h"),
                     Card.new(9,"d"),]
      hand2.cards = [Card.new(3,"d"),
                     Card.new(3,"d"),
                     Card.new(4,"d"),
                     Card.new(5,"h"),
                     Card.new(14,"d"),]
      expect(poker.beats?(hand1, hand2)).to eq(-1)
    end

    it "returns 1 3ofkind vs 2pair" do
      hand1.cards = [Card.new(2,"d"),
                     Card.new(2,"d"),
                     Card.new(2,"d"),
                     Card.new(5,"h"),
                     Card.new(9,"d"),]
      hand2.cards = [Card.new(3,"d"),
                     Card.new(3,"d"),
                     Card.new(5,"d"),
                     Card.new(5,"h"),
                     Card.new(9,"d"),]
      expect(poker.beats?(hand1, hand2)).to eq(-1)
    end

    it "returns 1 higher flush vs flush" do
      hand1.cards = [Card.new(2,"d"),
                     Card.new(2,"d"),
                     Card.new(3,"d"),
                     Card.new(5,"d"),
                     Card.new(11,"d"),]
      hand2.cards = [Card.new(3,"d"),
                     Card.new(3,"d"),
                     Card.new(4,"d"),
                     Card.new(5,"d"),
                     Card.new(10,"d"),]
      expect(poker.beats?(hand1, hand2)).to eq(1)
    end

    it "return 1 higher straight vs straight" do
      hand1.cards = [Card.new(2,"d"),
                     Card.new(3,"d"),
                     Card.new(4,"d"),
                     Card.new(5,"h"),
                     Card.new(6,"d"),]
      hand2.cards = [Card.new(14,"d"),
                     Card.new(2,"d"),
                     Card.new(4,"d"),
                     Card.new(5,"h"),
                     Card.new(3,"d"),]
      expect(poker.beats?(hand1, hand2)).to eq(1)
    end

    it "return 1 higher straightflush vs straightflush" do
      hand1.cards = [Card.new(10,"d"),
                     Card.new(11,"d"),
                     Card.new(12,"d"),
                     Card.new(13,"d"),
                     Card.new(14,"d"),]
      hand2.cards = [Card.new(2,"d"),
                     Card.new(3,"d"),
                     Card.new(4,"d"),
                     Card.new(5,"d"),
                     Card.new(6,"d"),]
      expect(poker.beats?(hand1, hand2)).to eq(1)
    end
  end
end