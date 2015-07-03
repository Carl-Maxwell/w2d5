require 'rspec'
require 'card'

describe Card do
  describe "#initialize"
    subject(:card) { Card.new(:ace, :spade) }
      it "initializes with a suit and value" do
        expect(card.suit).to eq(:spade)
        expect(card.value).to eq(:ace)
      end
  end

  describe "#override spaceship operator" do
    subject(:two_of_hearts) { Card.new(:two, :heart) }
    subject(:king_of_diamonds) { Card.new(:king, :diamond) }
    it "two of hearts is less than king of diamonds" do
      expect(two_of_hearts < king_of_diamonds).to be(true)
    end
  end

  describe "::suits" do
    it "returns a list of the suits" do
      expect(Card::suits).to contain_exactly(:club, :diamond, :heart, :spade)
    end
  end

  describe "::values" do
    it "returns a list of the values" do
      expect(Card::suits).to include(:ace, :king, :queen, :jack, :five)
    end
  end
end
