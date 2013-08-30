require 'hand.rb'
require 'deck.rb'

describe Hand do
  let(:deck) { double('deck') }
  before(:each) do
    deck.stub(:draw).and_return(Card.new(2, 'd'))
  end
  subject(:hand) { Hand.new(deck) }

  # it "should have five cards" do
  #   expect(hand.cards.length).to eq(5)
  # end

  describe "#type" do
    it "works with highcard" do
      hand.cards = [Card.new(2,"d"),
                    Card.new(3,"d"),
                    Card.new(5,"d"),
                    Card.new(7,"d"),
                    Card.new(9,"s"),]
      expect(hand.type[0]).to eq(:highcard)
    end

    it "works with pair" do
      hand.cards = [Card.new(2,"d"),
                    Card.new(2,"d"),
                    Card.new(5,"d"),
                    Card.new(7,"d"),
                    Card.new(9,"s"),]
      expect(hand.type[0]).to eq(:pair)
    end

    it "works with twopair" do
      hand.cards = [Card.new(2,"d"),
                    Card.new(2,"d"),
                    Card.new(5,"d"),
                    Card.new(5,"d"),
                    Card.new(9,"s"),]
      expect(hand.type[0]).to eq(:twopair)
    end

    it "works with threekind" do
      hand.cards = [Card.new(3,"d"),
                    Card.new(7,"d"),
                    Card.new(5,"d"),
                    Card.new(5,"d"),
                    Card.new(5,"s"),]
      expect(hand.type[0]).to eq(:threekind)
    end

    it "works with fourkind" do
      hand.cards = [Card.new(12,"d"),
                    Card.new(10,"d"),
                    Card.new(10,"d"),
                    Card.new(10,"d"),
                    Card.new(10,"s"),]
      expect(hand.type[0]).to eq(:fourkind)
    end

    it "works with house" do
      hand.cards = [Card.new(2,"d"),
                    Card.new(2,"d"),
                    Card.new(5,"d"),
                    Card.new(5,"d"),
                    Card.new(2,"s"),]
      expect(hand.type[0]).to eq(:house)
    end
    it "works with flush" do
      hand.cards = [Card.new(2,"d"),
                    Card.new(2,"d"),
                    Card.new(5,"d"),
                    Card.new(5,"d"),
                    Card.new(9,"d"),]
      expect(hand.type[0]).to eq(:flush)
    end

    it "works with straight" do
      hand.cards = [Card.new(14,"d"),
                    Card.new(2,"d"),
                    Card.new(3,"d"),
                    Card.new(4,"d"),
                    Card.new(5,"s"),]
      expect(hand.type[0]).to eq(:straight)
    end

    it "works with highest straight" do
      hand.cards = [Card.new(10,"d"),
                    Card.new(11,"d"),
                    Card.new(12,"d"),
                    Card.new(13,"d"),
                    Card.new(14,"s"),]
      expect(hand.type[0]).to eq(:straight)
    end

    it "works with straightflush" do
      hand.cards = [Card.new(10,"d"),
                    Card.new(11,"d"),
                    Card.new(12,"d"),
                    Card.new(13,"d"),
                    Card.new(14,"d"),]
      expect(hand.type[0]).to eq(:straightflush)
    end
  end


end