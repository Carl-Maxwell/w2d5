require_relative 'card'
require 'byebug'

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

  def high_card
    cards.max
  end

  def one_pair?
    cards.map(&:value).uniq.length < 5
  end

  def straight_flush?
    suits.uniq.count == 1 &&
    values.max - values.min == 4
  end

  def four_of_a_kind?
    values.uniq.count == 2
  end

  def three_of_a_kind?
    values.any? { |value| values.count(value) == 3 }
  end

  def full_house?
    four_of_a_kind? && three_of_a_kind?
  end

  def two_pair?
    values.count { |value| values.count(value) == 2 } == 4
  end

  def suits
    cards.map(&:suit)
  end

  def values
    cards.map(&:poker_value)
  end
end
