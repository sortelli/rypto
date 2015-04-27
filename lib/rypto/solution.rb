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

    def push(solution)
      @solutions << solution
    end
  end
end
