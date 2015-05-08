require "rypto"

module Rypto
  # Solution returned by {Rypto::Hand#solve}
  class Solution
    # @private
    def initialize(target)
      @target    = target
      @solutions = []
    end

    # Array of all solutions in postfix notation.
    # @return [Array<String>]
    def postfix
      @solutions.map do |solution|
        '%s = %d' % [solution.join(" "), @target]
      end
    end

    # Array of all solutions in infix notation.
    # @return [Array<String>]
    def infix
      @solutions.map do |solution|
        stack = []

        solution.each do |s|
          if s.is_a? Fixnum
            stack.push expr: s, precedence: 3
          else
            b = stack.pop
            a = stack.pop
            p = {'-' => 1, '+' => 1, '*' => 2, '/' => 2}[s]

            a[:expr] = "(#{a[:expr]})" if a[:precedence] < p
            b[:expr] = "(#{b[:expr]})" if b[:precedence] <= p

            stack.push expr: '%s %s %s' % [a[:expr], s, b[:expr]], precedence: p
          end
        end

        '%s = %d' % [stack.pop[:expr], @target]
      end
    end

    # Add solution to list of possible solutions
    # @private 
    def push(solution)
      @solutions << solution
    end
  end
end
