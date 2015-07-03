require 'rspec'
require 'hand'

describe Hand do
  let(:cards) { [Card.new(:ace, :spade), Card.new(:two, :heart)]}
  let(:deck) { Deck.full_deck }
  subject(:fresh_hand) { Hand.new(cards, deck)}

  describe "#initialize" do
    it "takes an array of cards and a deck" do
      expect(fresh_hand.cards.count).to be(2)
      expect(fresh_hand.cards.deck).to be(deck)
    end
  end

  describe "#return_to_deck" do
    it "returns n cards to the deck" do
      fresh_hand.return_to_deck(cards[0])
      expect(deck).to receive(:return_cards).with(fresh_hand.cards[0])
      expect(fresh_hand.count).to be(1)
      expect(deck.cards.count).to be(53)
    end

  end













end
