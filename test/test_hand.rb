require_relative "test_helper"

class TestHand < Minitest::Test
  def test_hand
    krypto_cards = [1, 2, 3, 4, 5]
    target_card  = 6
    hand = Rypto::Hand.new krypto_cards, target_card
    assert_equal krypto_cards, hand.krypto_cards
    assert_equal target_card,  hand.target_card

    assert_instance_of Array,  Rypto::Hand.new.krypto_cards
    assert_instance_of Fixnum, Rypto::Hand.new.target_card
  end

  def test_bad_arguments
    assert_raises(ArgumentError) { Rypto::Hand.new  1     }
    assert_raises(ArgumentError) { Rypto::Hand.new  1,  2 }
    assert_raises(ArgumentError) { Rypto::Hand.new [1], 2 }

    assert_raises(ArgumentError) { Rypto::Hand.new [ 1,  2, 3, 4, 5]      }
    assert_raises(ArgumentError) { Rypto::Hand.new [ 1,  2, 3, 4, 5], 'a' }
    assert_raises(ArgumentError) { Rypto::Hand.new [ 1,  1, 1, 1, 2],  6  }
    assert_raises(ArgumentError) { Rypto::Hand.new [ 7,  7, 7, 7, 7],  6  }
    assert_raises(ArgumentError) { Rypto::Hand.new [ 1,  1, 1, 3, 4],  1  }
    assert_raises(ArgumentError) { Rypto::Hand.new [ 1,  2, 3, 4, 5], 26  }
    assert_raises(ArgumentError) { Rypto::Hand.new [12, 12, 3, 4, 5], 12  }
    assert_raises(ArgumentError) { Rypto::Hand.new [25, 25, 3, 4, 5], 12  }
  end
end
