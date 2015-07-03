require 'rspec'
require 'hand'

describe Hand do
  let(:cards) { [Card.new(:ace, :spades), Card.new(:two, :hearts)]}
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
  let(:high_cards) do
    [
      Card.new(:ace, :diamonds),
      Card.new(:ten, :diamonds),
      Card.new(:nine, :spades),
      Card.new(:five, :clubs),
      Card.new(:four, :clubs)
    ]
  end
    let(:straight_flush) do
      [
        Card.new(:eight, :hearts),
        Card.new(:seven, :hearts),
        Card.new(:six, :hearts),
        Card.new(:five, :hearts),
        Card.new(:four, :hearts)
      ]
    end
      let(:four_of_a_kind_cards) do
        [
          Card.new(:eight, :hearts),
          Card.new(:eight, :spades),
          Card.new(:eight, :clubs),
          Card.new(:eight, :diamonds),
          Card.new(:four, :hearts)
        ]
      end
  
  subject(:high_card) { Hand.new(high_cards, deck)}
  subject(:straight_flush) { Hand.new(straight_flush, deck)}
  subject(:four_of_a_kind) { Hand.new(four_of_a_kind_cards, deck)}

  describe "#straight_flush?" do
    it "returns true" do
      expect(straight_flush.straight_flush?).to be(true)
    end

    it "returns false" do
      expect(high_card.straight_flush?).to be(false)
    end
  end

  describe "#four_of_a_kind?" do
    it "returns true" do
      expect(four_of_a_kind.four_of_a_kind?).to be(true)
    end

    it "returns false" do
      expect(high_card.four_of_a_kind?).to be(false)
    end
  end

  describe "#three_of_a_kind?" do
    it "returns true" do
      expect(four_of_a_kind.three_of_a_kind?).to be(true)
    end

    it "returns false" do
      expect(high_card.three_of_a_kind?).to be(false)
    end
  end

  describe "#one_pair?" do
    it "returns true" do
      expect(four_of_a_kind.one_pair?).to be(true)
    end

    it "returns false" do
      expect(high_card.one_pair?).to be(false)
    end
  end

  describe "#full_house?" do
    it "returns true" do
      expect(four_of_a_kind.full_house?).to be(true)
    end

    it "returns false" do
      expect(high_card.full_house?).to be(false)
    end
  end


#high_card => highest value card in hand


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
