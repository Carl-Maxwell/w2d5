require_relative 'card'

class Hand
  def self.from_string(str, deck)
    Hand.new(Card::from_string(str), deck)
  end

  attr_reader :cards, :deck

  def initialize(cards, deck)
    @cards = cards
    @deck = deck
  end

  def return_to_deck(returned_cards)
    to_return = cards.select do |card|
      returned_cards.any? { |returned| returned.object_id == card.object_id}
    end
    deck.return_cards(to_return)
    cards.reject! do |card| 
      returned_cards.any? { |returned| returned.object_id == card.object_id}
    end
  end
end
