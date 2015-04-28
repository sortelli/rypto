require "rypto"

module Rypto
  class Solution
    def initialize(target)
      @target    = target
      @solutions = []
    end

    def postfix
      @solutions.map do |solution|
        '%s = %d' % [solution.join(" "), @target]
      end
    end

    def infix
      @solutions.map do |solution|
        stack = []
        solution.each do |s|
          if s.is_a? Fixnum
            stack.push s
          else
            b = stack.pop
            a = stack.pop
            stack.push('(%s %s %s)' % [a, s, b])
          end
        end
        '%s = %d' % [stack.join(" "), @target]
      end
    end

    def push(solution)
      @solutions << solution
    end
  end
end
