require 'deck.rb'

describe Deck do
  subject(:deck) { Deck.new }
  its(:cards.length) { should eq 52 }

  describe "#draw" do
    it "draws a card" do
      expect(deck.draw).to be_a(Card)
    end

    it "draws randomly" do
      first = deck.draw
      expect(deck.draw).to not_be(first)
    end

    it "removes the card from deck" do
      deck.draw
      expect(deck.cards.length).to eq(51)
    end
  end


  it "decks aren't identical" do
    card = Deck.new.draw
    expect(deck.draw.value).to not_be(card.value)
  end
end