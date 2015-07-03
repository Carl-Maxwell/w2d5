SUIT_STRINGS = {
    :clubs    => "C",
    :diamonds => "D",
    :hearts   => "H",
    :spades   => "S"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "T",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  POKER_VALUE = {
    :deuce => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 10,
    :queen => 10,
    :king  => 10
  }
def self.from_string(str)
  string_to_suit = SUIT_STRINGS.invert
  string_to_value = VALUE_STRINGS.invert
  cards = str.split
  card_objects = []
  cards.each do |card|
    val, suit = card.split('')
    card_objects << Card.new(string_to_val[val], string_to_suit[suit])
  end

  card_objects
end
