require "rypto"

module Rypto
  # Used internally by {Rypto::Hand} to generate solutions
  class BruteForceSolver
    attr_reader :hand

    # @private
    def initialize(hand)
      @hand     = hand
      @solution = Solution.new(@hand.target_card)
    end

    # Generate solutions to a {Rypto::Hand}
    # @private
    def solve
      ops = %w{+ - * /}

      @hand.krypto_cards.permutation.each do |cards|
        ops.each { |op1| ops.each { |op2| ops.each { |op3| ops.each { |op4|
          check_exprs cards, op1, op2, op3, op4
        }}}}
      end

      @solution
    end

    private

    def check_exprs(cards, op1, op2, op3, op4)
      [
        [cards[0], cards[1], cards[2], cards[3], op1,      cards[4], op2,      op3,      op4],
        [cards[0], cards[1], cards[2], op1,      cards[3], cards[4], op2,      op3,      op4],
        [cards[0], cards[1], op1,      cards[2], op2,      cards[3], cards[4], op3,      op4],
        [cards[0], cards[1], op1,      cards[2], op2,      cards[3], op3,      cards[4], op4],
        [cards[0], cards[1], cards[2], cards[3], cards[4], op1,      op2,      op3,      op4],
        [cards[0], cards[1], cards[2], op1,      cards[3], op2,      op3,      cards[4], op4],
        [cards[0], cards[1], cards[2], op1,      op2,      cards[3], cards[4], op3,      op4],
        [cards[0], cards[1], cards[2], op1,      op2,      cards[3], op3,      cards[4], op4],
        [cards[0], cards[1], op1,      cards[2], cards[3], cards[4], op2,      op3,      op4],
        [cards[0], cards[1], cards[2], op1,      cards[3], op2,      cards[4], op3,      op4],
        [cards[0], cards[1], cards[2], cards[3], op1,      op2,      cards[4], op3,      op4],
        [cards[0], cards[1], cards[2], cards[3], op1,      op2,      op3,      cards[4], op4],
        [cards[0], cards[1], op1,      cards[2], cards[3], op2,      cards[4], op3,      op4],
        [cards[0], cards[1], op1,      cards[2], cards[3], op2,      op3,      cards[4], op4]
      ].each do |expr|
        @solution.push(expr) if check_expr(expr)
      end
    end

    # Assumes valid postfix expression
    def check_expr(expr)
      stack = []

      expr.each do |e|
        if e.is_a? Fixnum
          stack.push e
        else
          b = stack.pop
          a = stack.pop

          case e
            when '+' then stack.push(a + b)
            when '*' then stack.push(a * b)
            when '-' then
              return false if b > a
              stack.push(a - b)
            else
              return false if b == 0 or a % b != 0
              stack.push(a / b)
          end
        end
      end

      stack.pop == @hand.target_card
    end
  end
end
