require "rypto/version"

module Rypto
  class Hand
    attr_reader :krypto_cards, :target_card

    # A individual hand of Krypto
    def initialize(krypto_cards = nil, target_card = nil)
      if !krypto_cards.nil? and target_card.nil?
        raise ArgumentError, "Rypto::Hand#new must be called with 0 or 2 arguments"
      end

      if krypto_cards.nil?
        cards = Deck.new.deal_cards
        @krypto_cards = @cards[0, 5]
        @target_card  = @cards[5]
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
  end

  # A Krypto deck contains 56 numeric cards. Three each of numbers
  # 1 through 6, four each of 7 through 10, two each of 11 through
  # 17, and one each of 18 through 25.
  class Deck
    attr_reader :cards

    def initialize
      @cards = ((1..6).to_a * 3 + (7..10).to_a * 4 + (11..17).to_a * 2 + (18..25).to_a).shuffle
    end

    def draw_card(card)
      index = @cards.index card
      raise ArgumentError, "#{card} is not in the deck" if index.nil?
      @cards.delete_at index
    end

    def deal_cards
      raise "Not enough cards to deal a hand" unless can_deal?
      @cards.slice!(0, 6)
    end

    def deal_hand
      cards = deal_cards
      Hand.new(cards[0, 5], cards[5])
    end

    def size
      @cards.size
    end

    def can_deal?
      size() >= 6
    end
  end
end
