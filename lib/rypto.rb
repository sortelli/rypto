require "rypto/version"
require "rypto/solution"
require "rypto/brute_force_solver"

# Top level module for the Rypto library
module Rypto
  # A individual hand of Krypto
  #
  # @!attribute krypto_cards [r]
  #    @return [Array(Fixnum, Fixnum, Fixnum, Fixnum, Fixnum)] the five krypto cards to evaluate
  #
  # @!attribute target_card [r]
  #    @return [Fixnum] the target card that the expression made from
  #            the five krypto_cards should equal
  class Hand
    attr_reader :krypto_cards, :target_card

    # May be called with 0 or 2 arguments.  If called with 0
    # arguments, will return a random deal from a full {Rypto::Deck}.  If
    # called with 2 arguments, will create a hand from the specified
    # values.
    # 
    # @param krypto_cards [Array(Fixnum, Fixnum, Fixnum, Fixnum, Fixnum)]  
    #                     Array of five krypto card values
    # @param target_card  [Fixnum]
    #                     Target card value
    def initialize(krypto_cards = nil, target_card = nil)
      if !krypto_cards.nil? and target_card.nil?
        raise ArgumentError, "Rypto::Hand#new must be called with 0 or 2 arguments"
      end

      if krypto_cards.nil?
        cards = Deck.new.deal_cards
        @krypto_cards = cards[0, 5]
        @target_card  = cards[5]
      else
        unless krypto_cards.is_a?(Array) and krypto_cards.size == 5
          raise ArgumentError, "Expected first argument to be an array of 5 integers"
        end

        tmp_deck = Deck.new
        krypto_cards.each {|card| tmp_deck.draw_card card}
        tmp_deck.draw_card target_card

        @krypto_cards = krypto_cards
        @target_card  = target_card
      end
    end

    # Get all possible solutions for the hand
    # @return [Solution]
    def solve
      BruteForceSolver.new(self).solve
    end
  end

  # A Krypto {Rypto::Deck} contains 56 numeric cards. Three each of numbers
  # 1 through 6, four each of 7 through 10, two each of 11 through
  # 17, and one each of 18 through 25.
  #
  # @!attribute cards [r]
  #    @return [Array<Fixnum>] all the card values left in the deck
  class Deck
    attr_reader :cards

    # Create a randomized deck of Krypto cards
    def initialize
      @cards = ((1..6).to_a * 3 + (7..10).to_a * 4 + (11..17).to_a * 2 + (18..25).to_a).shuffle
    end

    # Draw a single card from the deck
    #
    # @param cards [Fixnum] the card value to draw
    # @return [Fixnum] the card value that was drawn
    # @raise [ArgumentError] if the card is not in the deck
    def draw_card(card)
      index = @cards.index card
      raise ArgumentError, "#{card} is not in the deck" if index.nil?
      @cards.delete_at index
    end

    # Deal six raw card values from the deck
    #
    # @return [Array(Fixnum, Fixnum, Fixnum, Fixnum, Fixnum, Fixnum)] a random hand from the deck
    # @raise [RuntimeError] if there are not enough cards to deal a full hand in the deck
    def deal_cards
      raise "Not enough cards to deal a hand" unless can_deal?
      @cards.slice!(0, 6)
    end

    # Deal a {Rypto::Hand} from the deck
    # @return [Hand] a random hand from the deck
    # @raise [RuntimeError] if there are not enough cards to deal a full hand in the deck
    def deal_hand
      cards = deal_cards
      Hand.new(cards[0, 5], cards[5])
    end

    # Size of the deck
    # @return [Fixnum] number of cards left in the deck
    def size
      @cards.size
    end

    # Check if there are enough cards left to deal a new hand
    # @return [Boolean]
    def can_deal?
      size() >= 6
    end
  end
end
