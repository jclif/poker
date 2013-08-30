require 'hand.rb'

describe Hand do
  subject(:hand) { Hand.new }

  describe "#beats?" do
    it "returns false pair vs higher pair"

    it "returns false pair vs pair with A"

    it "returns true 3ofkind vs 2pair"

    it "returns true higher flush vs flush"

    it "return true higher straight vs straight"

    it "return false higher straightflush vs straightflush"
  end

  describe "#type" do

    it "works with highcard" do
      hand.cards = [Card.new(2,"d"),
                    Card.new(3,"d"),
                    Card.new(5,"d"),
                    Card.new(7,"d"),
                    Card.new(9,"s"),]
      expect(hand.type).to eq(:highcard)
    end

    it "works with pair" do
      hand.cards = [Card.new(2,"d"),
                    Card.new(2,"d"),
                    Card.new(5,"d"),
                    Card.new(7,"d"),
                    Card.new(9,"s"),]
      expect(hand.type).to eq(:pair)
    end

    it "works with 2pair" do
      hand.cards = [Card.new(2,"d"),
                    Card.new(2,"d"),
                    Card.new(5,"d"),
                    Card.new(5,"d"),
                    Card.new(9,"s"),]
      expect(hand.type).to eq(:twopair)
    end

    it "works with 3ofkind" do
      hand.cards = [Card.new(3,"d"),
                    Card.new(7,"d"),
                    Card.new(5,"d"),
                    Card.new(5,"d"),
                    Card.new(5,"s"),]
      expect(hand.type).to eq(:threekind)
    end

    it "works with 4ofkind" do
      hand.cards = [Card.new(12,"d"),
                    Card.new(10,"d"),
                    Card.new(10,"d"),
                    Card.new(10,"d"),
                    Card.new(10,"s"),]
      expect(hand.type).to eq(:fourkind)
    end

    it "works with house" do
      hand.cards = [Card.new(2,"d"),
                    Card.new(2,"d"),
                    Card.new(5,"d"),
                    Card.new(5,"d"),
                    Card.new(2,"s"),]
      expect(hand.type).to eq(:house)
    end
    it "works with flush" do
      hand.cards = [Card.new(2,"d"),
                    Card.new(2,"d"),
                    Card.new(5,"d"),
                    Card.new(5,"d"),
                    Card.new(9,"d"),]
      expect(hand.type).to eq(:flush)
    end

    it "works with straight" do
      hand.cards = [Card.new(1,"d"),
                    Card.new(2,"d"),
                    Card.new(3,"d"),
                    Card.new(4,"d"),
                    Card.new(5,"s"),]
      expect(hand.type).to eq(:straight)
    end

    it "works with highest straight" do
      hand.cards = [Card.new(10,"d"),
                    Card.new(11,"d"),
                    Card.new(12,"d"),
                    Card.new(13,"d"),
                    Card.new(1,"s"),]
      expect(hand.type).to eq(:straight)
    end

    it "works with straightflush" do
      hand.cards = [Card.new(10,"d"),
                    Card.new(11,"d"),
                    Card.new(12,"d"),
                    Card.new(13,"d"),
                    Card.new(1,"d"),]
      expect(hand.type).to eq(:straightflush)
    end

  end
end