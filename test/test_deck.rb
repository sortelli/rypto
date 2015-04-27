require_relative "test_helper"

class TestHand < Minitest::Test
  def test_deck
    deck  = Rypto::Deck.new
    cards = (1..6).to_a * 3 + (7..10).to_a * 4 + (11..17).to_a * 2 + (18..25).to_a
    assert_equal cards.sort, deck.cards.sort

    assert_equal 1, deck.draw_card(1)
    assert_equal 1, deck.draw_card(1)
    assert_equal 1, deck.draw_card(1)
    assert_raises(ArgumentError) { deck.draw_card 1 }

    assert_instance_of Array, deck.deal_cards
    assert_equal 6, deck.deal_cards.size

    assert_instance_of Rypto::Hand, deck.deal_hand
  end

  def test_full_deal
    deck  = Rypto::Deck.new

    assert deck.can_deal?
    9.times { deck.deal_hand }
    assert !deck.can_deal?

    assert_equal 2, deck.cards.size 

    exp = assert_raises(RuntimeError) { deck.deal_hand }
    assert_equal "Not enough cards to deal a hand", exp.message
  end

  def test_bad_arguments
    assert_raises(ArgumentError) { Rypto::Deck.new 1 }
    assert_raises(ArgumentError) { Rypto::Deck.new.draw_card 'a' }
    assert_raises(ArgumentError) { Rypto::Deck.new.draw_card 26  }
  end
end
