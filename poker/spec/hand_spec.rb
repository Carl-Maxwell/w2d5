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

  # Hand::from_string
  

  # ----------------------------------------------------------------------------
  # hand helpers
  # ----------------------------------------------------------------------------

  let(:straight_flush) { Hand::from_string("8H 7H 6H 5H 4H", deck) }
  let(:straight_flush_lower) { Hand::from_string("7H 6H 5H 4H 3H", deck) }

  let(:four_of_a_kind) { Hand::from_string("8H 8S 8C 8D 4H", deck)}
  let(:four_of_a_kind_lower) { Hand::from_string("8H 8S 8C 8D 3H", deck)}

  let(:full_house) { Hand::from_string("8H 8S 8C 4D 4H", deck) }
  let(:full_house_lower) { Hand::from_string("7H 7S 7C 4D 4H", deck) }

  let(:flush) { Card::from_string("8H 7H 6H 5H KH") }
  let(:flush_lower) { Card::from_string("8H 7H 6H 5H JH") }

  let(:straight) { Card::from_string("8H 7H 6H 5H 4C") }
  let(:straight_lower) { Card::from_string("7H 6H 5H 4H 3C") }

  let(:three_of_a_kind) { Card::from_string("7H 7H 7H 4H 3C") }
  let(:three_of_a_kind_lower) { Card::from_string("6H 6H 6H 4H 3C") }

  let(:two_pair) { Card::from_string("7H 7H 5H 5H 3C") }
  let(:two_pair_lower) { Card::from_string("6H 6H 5H 5H 3C") }

  let(:a_pair) { Card::from_string("7H 7H 5H 4H 3C") }
  let(:a_pair_lower) { Card::from_string("6H 6H 5H 4H 3C") }

  let(:high) { Hand::from_string("AD TD 9S 5C 4C", deck) }
  let(:high_lower) { Hand::from_string("2D TD 9S 5C 4C", deck) }

  describe "#straight_flush?" do
    it "returns true" do
      expect(straight_flush.straight_flush?).to be(true)
    end

    it "returns false" do
      expect(high.straight_flush?).to be(false)
    end
  end

  describe "#four_of_a_kind?" do
    it "returns true" do
      expect(four_of_a_kind.four_of_a_kind?).to be(true)
    end

    it "returns false" do
      expect(high.four_of_a_kind?).to be(false)
    end
  end

  describe "#three_of_a_kind?" do
    it "returns true" do
      expect(three_of_a_kind.three_of_a_kind?).to be(true)
    end

    it "returns false" do
      expect(high.three_of_a_kind?).to be(false)
    end
  end

  describe "#one_pair?" do
    it "returns true" do
      expect(a_pair.one_pair?).to be(true)
    end

    it "returns false" do
      expect(high.one_pair?).to be(false)
    end
  end

  describe "#full_house?" do
    it "returns true" do
      expect(full_house.full_house?).to be(true)
    end

    it "returns false" do
      expect(high.full_house?).to be(false)
    end
  end

  describe "#two_pair?" do
    it "returns true" do
      expect(two_pair.two_pair?).to be(true)
    end

    it "returns false" do
      expect(high.two_pair?).to be(false)
    end
  end

  describe "#flush?" do
    it "returns true" do
      expect(flush.flush?).to be(true)
    end

    it "returns false" do
      expect(high.flush?).to be(false)
    end
  end

  describe "#straight?" do
    it "returns true" do
      expect(straight.straight?).to be(true)
    end

    it "returns false" do
      expect(high.straight?).to be(false)
    end
  end

  describe "#beats?" do
    it "returns correctly from two high card hands" do
      expect(high.beats?(high_lower)).to be(true)
      expect(high_lower.beats?(high)).to be(false)
    end

    it "returns correctly when given a straight flush and high card hand" do
      expect(straight_flush.beats?(high_lower)).to be(true)
      expect(high_lower.beats?(straight_flush)).to be(false)
    end

    it "returns correctly when given a straight flush and high card hand" do
      expect(straight_flush.beats?(high_lower)).to be(true)
      expect(high_lower.beats?(straight_flush)).to be(false)
    end

    it "deals appropriately with ties" do
      it "Straight flush" do
        expect(straight_flush.beats?(straight_flush_lower)).to eq(true)
      end
      it "Four of a kind" do
        expect(four_of_a_kind.beats?(four_of_a_kind_lower)).to eq(true)
      end
      it "Full house" do
        expect(full_house.beats?(full_house_lower)).to eq(true)
      end
      it "Flush" do
        expect(flush.beats?(flush_lower)).to eq(true)
      end
      it "Straight" do
        expect(straight.beats?(straight_lower)).to eq(true)
      end
      it "Three of a kind" do
        expect(three_of_a_kind.beats?(three_of_a_kind_lower)).to eq(true)
      end
      it "Two pair" do
        expect(two_pair.beats?(two_pair_lower)).to eq(true)
      end
      it "One pair" do
        expect(one_pair.beats?(one_pair_lower)).to eq(true)
      end
      it "High card" do
        expect(high.beats?(high_lower)).to eq(true)
      end
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
