require 'rspec'
require 'hand'

describe Hand do
  let(:ace_of_spades) { Card.new(:ace, :spades) }
  let(:cards) { [ace_of_spades, Card.new(:two, :hearts)]}
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

  describe "#high_card" do
    it "returns the highest card in the hand" do
      expect(fresh_hand.high_card).to eq(ace_of_spades)
    end
  end







  #high card to high card

  # ----------------------------------------------------------------------------
  # hand helpers
  # ----------------------------------------------------------------------------

  let(:high_cards) { Card::from_string("AD TD 9S 5C 4C") }
  let(:high_cards_lower) { Card::from_string("2D TD 9S 5C 4C") }
  let(:straight_flush) { Card::from_string("8H 7H 6H 5H 4H") }

  let(:four_of_a_kind_cards) { Card::from_string("8H 8S 8C 8D 4H")}

  let(:full_house_cards) { Card::from_string("8H 8S 8C 4D 4H") }

  let(:flush) { Card::from_string("8H 7H 6H 5H KH") }

  let(:straight) { Card::from_string("8H 7H 6H 5H 4C") }

  subject(:high_card_hand1) { Hand.new(high_cards, deck)}
  subject(:high_card_hand_lower) { Hand.new(high_cards_lower, deck)}
  subject(:straight_flush) { Hand.new(straight_flush, deck)}
  subject(:flush) { Hand.new(flush, deck)}
  subject(:straight) { Hand.new(straight, deck)}
  subject(:four_of_a_kind) { Hand.new(four_of_a_kind_cards, deck)}
  subject(:full_house) { Hand.new(full_house, deck)}

  describe "#straight_flush?" do
    it "returns true" do
      expect(straight_flush.straight_flush?).to be(true)
    end

    it "returns false" do
      expect(high_card_hand1.straight_flush?).to be(false)
    end
  end

  describe "#four_of_a_kind?" do
    it "returns true" do
      expect(four_of_a_kind.four_of_a_kind?).to be(true)
    end

    it "returns false" do
      expect(high_card_hand1.four_of_a_kind?).to be(false)
    end
  end

  describe "#three_of_a_kind?" do
    it "returns true" do
      expect(four_of_a_kind.three_of_a_kind?).to be(true)
    end

    it "returns false" do
      expect(high_card_hand1.three_of_a_kind?).to be(false)
    end
  end

  describe "#one_pair?" do
    it "returns true" do
      expect(four_of_a_kind.one_pair?).to be(true)
    end

    it "returns false" do
      expect(high_card_hand1.one_pair?).to be(false)
    end
  end

  describe "#full_house?" do
    it "returns true" do
      expect(full_house.full_house?).to be(true)
    end

    it "returns false" do
      expect(high_card_hand1.full_house?).to be(false)
    end
  end

  describe "#two_pair?" do
    it "returns true" do
      expect(full_house.two_pair?).to be(true)
    end

    it "returns false" do
      expect(high_card_hand1.two_pair?).to be(false)
    end
  end

  describe "#flush?" do
    it "returns true" do
      expect(flush.flush?).to be(true)
    end

    it "returns false" do
      expect(high_card_hand1.flush?).to be(false)
    end
  end

  describe "#straight?" do
    it "returns true" do
      expect(straight.straight?).to be(true)
    end

    it "returns false" do
      expect(high_card_hand1.straight?).to be(false)
    end
  end

  #straight flush to high card
  describe "#beats?" do
    it "returns the correct hand from two high card hands" do
      expect(high_card_hand1.beats?(high_card_hand_lower)).to be(true)
    end
  end
#hands that exist:

  # four of a kind
  # full house = three of a kind + two of a kind
  # three of a kind
  # two pair
  # one pair

  #straight_flush = all of same suit, in sequence
  #flush = all of same suit, values not in sequence

  #straight = all cards are in sequence, different suits

  #high card

#hand values:
# [
#   "Straight flush",
#   "Four of a kind",
#   "Full house",
#   "Flush",
#   "Straight",
#   "Three of a kind",
#   "Two pair",
#   "One pair",
#   "High card"
# ]
#
#

end
