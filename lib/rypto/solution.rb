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
            stack.push left: a, op: s, right: b
          end
        end

        '%s = %d' % [expr_tree_to_infix(stack.pop), @target]
      end
    end

    def push(solution)
      @solutions << solution
    end

    private

    def expr_tree_to_infix(node, parent_node = nil)
      return node.to_s if node.is_a? Fixnum
      use_parens = parent_node && op_precedence(parent_node[:op]) > op_precedence(node[:op])
      '%s%s %s %s%s' % [
        use_parens ? '(' : nil,
        expr_tree_to_infix(node[:left], node),
        node[:op],
        expr_tree_to_infix(node[:right], node),
        use_parens ? ')' : nil
      ]
    end

    def op_precedence(op)
      case op
        when '/', '*' then 2
        else
          1
      end
    end
  end
end
