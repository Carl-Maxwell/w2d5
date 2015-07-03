require 'rspec'
require 'deck'

describe Deck do

  subject(:partial_deck) do
     Deck.new([Card.new(:ace, :spade), Card.new(:two, :heart)])
   end

  describe "#initialize" do
    it "allows a partial deck" do
      expect(partial_deck.count).to be(2)
    end
  end

  subject(:fresh_deck) { Deck.full_deck }
  describe "::full_deck" do
    it "returns a full deck of cards" do
      expect(fresh_deck.count).to eq(52)
    end
  end

  describe "#take" do
    it "takes n number of cards from the deck" do
      partial_deck.take(2)
      expect(partial_deck.count).to be(0)
    end

    it "takes the correct cards from top of the deck" do
      subject(:returned_cards) { partial_deck.take(1) }
      expect(returned_cards[0].value).to eq(:ace)
    end
  end

end
