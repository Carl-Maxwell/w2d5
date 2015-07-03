class Hand
  def self.from_string(str, deck)
    Hand.new(Card::from_string(str), deck)
  end
end
