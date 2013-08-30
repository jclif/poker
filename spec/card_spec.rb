require 'card.rb'

describe Card do
  subject(:card) { Card.new(4, 's') }

  it "has a suit" do
    expect(card.suit).to eq('s')
  end

  it "has a value" do
    expect(card.rank).to eq('4')
  end

  it "renders itself" do
    expect(card.render).to eq('4♠')
  end

  it "renders face cards" do
    card.rank = 13
    expect(card.render).to eq('K♠')
  end
end