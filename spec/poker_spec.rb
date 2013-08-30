require 'poker.rb'

describe Poker do
  let(:hand1) { double("hand1") }
  let(:hand2) { double("hand2") }
  subject(:poker) { Poker.new }

  describe "#beats?" do
    it "returns -1 pair vs higher pair" do
       hand1.stub(:type).and_return([:pair,
                    [Card.new(2,"d"),
                     Card.new(2,"d"),
                     Card.new(9,"d"),
                     Card.new(5,"h"),
                     Card.new(3,"d")]])
       hand2.stub(:type).and_return([:pair,
                    [Card.new(3,"d"),
                     Card.new(3,"d"),
                     Card.new(9,"d"),
                     Card.new(5,"h"),
                     Card.new(4,"d")]])
      expect(poker.beats?(hand1, hand2)).to eq(-1)
    end

    it "returns 0 same hand" do
      hand1.stub(:type).and_return([:pair,
                    [Card.new(2,"d"),
                     Card.new(2,"d"),
                     Card.new(9,"d"),
                     Card.new(5,"h"),
                     Card.new(3,"d")]])
      hand2.stub(:type).and_return([:pair,
                    [Card.new(2,"d"),
                     Card.new(2,"d"),
                     Card.new(9,"d"),
                     Card.new(5,"h"),
                     Card.new(3,"d")]])
      expect(poker.beats?(hand1, hand2)).to eq(0)
    end

    it "returns -1 pair vs pair with A" do
      hand1.stub(:type).and_return([:pair,
                    [Card.new(3,"d"),
                     Card.new(3,"d"),
                     Card.new(9,"d"),
                     Card.new(5,"h"),
                     Card.new(2,"d")]])
      hand2.stub(:type).and_return([:pair,
                    [Card.new(3,"d"),
                     Card.new(3,"d"),
                     Card.new(14,"d"),
                     Card.new(5,"h"),
                     Card.new(2,"d")]])
      expect(poker.beats?(hand1, hand2)).to eq(-1)
    end

    it "returns 1 3ofkind vs 2pair" do
      hand1.stub(:type).and_return([:threekind,
                    [Card.new(2,"d"),
                     Card.new(2,"d"),
                     Card.new(2,"d"),
                     Card.new(9,"h"),
                     Card.new(5,"d")]])
      hand2.stub(:type).and_return([:twopair,
                    [Card.new(3,"d"),
                     Card.new(3,"d"),
                     Card.new(5,"d"),
                     Card.new(5,"h"),
                     Card.new(9,"d")]])
      expect(poker.beats?(hand1, hand2)).to eq(1)
    end

    it "returns 1 higher flush vs flush" do
      hand1.stub(:type).and_return([:flush,
                    [Card.new(11,"d"),
                     Card.new(5,"d"),
                     Card.new(3,"d"),
                     Card.new(2,"d"),
                     Card.new(2,"d")]])
      hand2.stub(:type).and_return([:flush,
                    [Card.new(10,"d"),
                     Card.new(5,"d"),
                     Card.new(4,"d"),
                     Card.new(5,"d"),
                     Card.new(4,"d")]])
      expect(poker.beats?(hand1, hand2)).to eq(1)
    end

    it "return 1 higher straight vs straight" do
      hand1.stub(:type).and_return([:straight,
                    [Card.new(7,"d"),
                     Card.new(6,"d"),
                     Card.new(5,"d"),
                     Card.new(4,"h"),
                     Card.new(3,"d")]])
      hand2.stub(:type).and_return([:straight,
                    [Card.new(6,"d"),
                     Card.new(5,"d"),
                     Card.new(4,"d"),
                     Card.new(3,"h"),
                     Card.new(2,"d")]])
      expect(poker.beats?(hand1, hand2)).to eq(1)
    end

    it "return 1 higher straight vs straight with A" do
      hand1.stub(:type).and_return([:straight,
                    [Card.new(6,"d"),
                     Card.new(5,"d"),
                     Card.new(4,"d"),
                     Card.new(3,"h"),
                     Card.new(2,"d")]])
      hand2.stub(:type).and_return([:straight,
                    [Card.new(5,"d"),
                     Card.new(4,"d"),
                     Card.new(3,"d"),
                     Card.new(2,"h"),
                     Card.new(14,"d")]])
      expect(poker.beats?(hand1, hand2)).to eq(1)
    end

    it "return 1 higher straightflush vs straightflush" do
      hand1.stub(:type).and_return([:straightflush,
                    [Card.new(14,"d"),
                     Card.new(13,"d"),
                     Card.new(12,"d"),
                     Card.new(11,"d"),
                     Card.new(10,"d")]])
      hand2.stub(:type).and_return([:straightflush,
                    [Card.new(6,"d"),
                     Card.new(5,"d"),
                     Card.new(4,"d"),
                     Card.new(3,"d"),
                     Card.new(2,"d")]])
      expect(poker.beats?(hand1, hand2)).to eq(1)
    end
  end
end