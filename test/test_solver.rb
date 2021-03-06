require_relative "test_helper"

class TestHand < Minitest::Test
  def test_solution_1
    hand = Rypto::Hand.new([6, 16, 9, 15, 5], 22)
    solution = hand.solve

    assert_instance_of Rypto::Solution, solution
    assert_equal solution_1, solution.postfix.sort
  end

  def test_solution_2
    hand = Rypto::Hand.new [3, 23, 13, 16, 1], 20
    solution = hand.solve

    assert_instance_of Rypto::Solution, solution
    assert_equal [], solution.postfix.sort
  end

  def test_solution_3
    hand = Rypto::Hand.new [9, 22, 20, 4, 4], 8
    solution = hand.solve

    assert_instance_of Rypto::Solution, solution
    assert_equal solution_3, solution.infix.sort
  end

  def solution_1
    [
      "15 16 + 6 5 - * 9 - = 22",
      "15 16 + 6 5 - / 9 - = 22",
      "15 16 + 6 5 - 9 * - = 22",
      "15 16 + 9 - 6 5 - * = 22",
      "15 16 + 9 - 6 5 - / = 22",
      "15 16 + 9 6 5 - * - = 22",
      "15 16 + 9 6 5 - / - = 22",
      "15 16 5 + 9 6 - / + = 22",
      "15 16 6 - 5 / - 9 + = 22",
      "15 16 6 5 - * + 9 - = 22",
      "15 16 6 5 - * 9 - + = 22",
      "15 16 6 5 - / + 9 - = 22",
      "15 16 6 5 - / 9 - + = 22",
      "15 16 6 5 - 9 * - + = 22",
      "15 16 9 - + 6 5 - * = 22",
      "15 16 9 - + 6 5 - / = 22",
      "15 16 9 - 6 5 - * + = 22",
      "15 16 9 - 6 5 - / + = 22",
      "15 16 9 6 5 - * - + = 22",
      "15 16 9 6 5 - / - + = 22",
      "15 5 - 9 - 16 * 6 + = 22",
      "15 5 - 9 - 16 6 + * = 22",
      "15 5 - 9 - 6 * 16 + = 22",
      "15 5 - 9 - 6 16 + * = 22",
      "15 5 / 16 + 6 - 9 + = 22",
      "15 5 / 16 + 9 + 6 - = 22",
      "15 5 / 16 + 9 6 - + = 22",
      "15 5 / 16 6 - + 9 + = 22",
      "15 5 / 16 6 - 9 + + = 22",
      "15 5 / 16 9 + + 6 - = 22",
      "15 5 / 16 9 + 6 - + = 22",
      "15 5 / 16 9 6 - + + = 22",
      "15 5 / 9 + 16 + 6 - = 22",
      "15 5 / 9 + 16 6 - + = 22",
      "15 5 / 9 + 6 - 16 + = 22",
      "15 5 / 9 16 + + 6 - = 22",
      "15 5 / 9 16 + 6 - + = 22",
      "15 5 / 9 16 6 - + + = 22",
      "15 5 / 9 6 - + 16 + = 22",
      "15 5 / 9 6 - 16 + + = 22",
      "15 5 16 + 9 6 - / + = 22",
      "15 5 9 + - 16 * 6 + = 22",
      "15 5 9 + - 16 6 + * = 22",
      "15 5 9 + - 6 * 16 + = 22",
      "15 5 9 + - 6 16 + * = 22",
      "15 6 + 9 + 5 / 16 + = 22",
      "15 6 - 9 / 16 + 5 + = 22",
      "15 6 - 9 / 16 5 + + = 22",
      "15 6 - 9 / 5 + 16 + = 22",
      "15 6 - 9 / 5 16 + + = 22",
      "15 6 5 - * 16 + 9 - = 22",
      "15 6 5 - * 16 9 - + = 22",
      "15 6 5 - * 9 - 16 + = 22",
      "15 6 5 - / 16 + 9 - = 22",
      "15 6 5 - / 16 9 - + = 22",
      "15 6 5 - / 9 - 16 + = 22",
      "15 6 5 - 16 * + 9 - = 22",
      "15 6 5 - 16 * 9 - + = 22",
      "15 6 5 - 16 9 - * + = 22",
      "15 6 5 - 9 * - 16 + = 22",
      "15 6 9 + + 5 / 16 + = 22",
      "15 6 9 + / 16 + 5 + = 22",
      "15 6 9 + / 16 5 + + = 22",
      "15 6 9 + / 5 + 16 + = 22",
      "15 6 9 + / 5 16 + + = 22",
      "15 9 + 16 6 - 5 / - = 22",
      "15 9 + 6 + 5 / 16 + = 22",
      "15 9 - 16 + 6 5 - * = 22",
      "15 9 - 16 + 6 5 - / = 22",
      "15 9 - 16 6 5 - * + = 22",
      "15 9 - 16 6 5 - / + = 22",
      "15 9 - 5 - 16 * 6 + = 22",
      "15 9 - 5 - 16 6 + * = 22",
      "15 9 - 5 - 6 * 16 + = 22",
      "15 9 - 5 - 6 16 + * = 22",
      "15 9 - 6 / 16 + 5 + = 22",
      "15 9 - 6 / 16 5 + + = 22",
      "15 9 - 6 / 5 + 16 + = 22",
      "15 9 - 6 / 5 16 + + = 22",
      "15 9 - 6 5 - * 16 + = 22",
      "15 9 - 6 5 - / 16 + = 22",
      "15 9 - 6 5 - 16 * + = 22",
      "15 9 16 6 - 5 / - + = 22",
      "15 9 5 + - 16 * 6 + = 22",
      "15 9 5 + - 16 6 + * = 22",
      "15 9 5 + - 6 * 16 + = 22",
      "15 9 5 + - 6 16 + * = 22",
      "15 9 6 + + 5 / 16 + = 22",
      "15 9 6 + / 16 + 5 + = 22",
      "15 9 6 + / 16 5 + + = 22",
      "15 9 6 + / 5 + 16 + = 22",
      "15 9 6 + / 5 16 + + = 22",
      "15 9 6 5 - * - 16 + = 22",
      "15 9 6 5 - / - 16 + = 22",
      "16 15 + 6 5 - * 9 - = 22",
      "16 15 + 6 5 - / 9 - = 22",
      "16 15 + 6 5 - 9 * - = 22",
      "16 15 + 9 - 6 5 - * = 22",
      "16 15 + 9 - 6 5 - / = 22",
      "16 15 + 9 6 5 - * - = 22",
      "16 15 + 9 6 5 - / - = 22",
      "16 15 - 5 6 * + 9 - = 22",
      "16 15 - 5 6 * 9 - + = 22",
      "16 15 - 6 5 * + 9 - = 22",
      "16 15 - 6 5 * 9 - + = 22",
      "16 15 5 - 9 - * 6 + = 22",
      "16 15 5 - 9 - / 6 + = 22",
      "16 15 5 - 9 - 6 * + = 22",
      "16 15 5 / + 6 - 9 + = 22",
      "16 15 5 / + 9 + 6 - = 22",
      "16 15 5 / + 9 6 - + = 22",
      "16 15 5 / 9 + + 6 - = 22",
      "16 15 5 / 9 + 6 - + = 22",
      "16 15 5 / 9 6 - + + = 22",
      "16 15 5 9 + - * 6 + = 22",
      "16 15 5 9 + - / 6 + = 22",
      "16 15 5 9 + - 6 * + = 22",
      "16 15 6 + 9 + 5 / + = 22",
      "16 15 6 - 9 / + 5 + = 22",
      "16 15 6 - 9 / 5 + + = 22",
      "16 15 6 5 - * + 9 - = 22",
      "16 15 6 5 - * 9 - + = 22",
      "16 15 6 5 - / + 9 - = 22",
      "16 15 6 5 - / 9 - + = 22",
      "16 15 6 5 - 9 * - + = 22",
      "16 15 6 9 + + 5 / + = 22",
      "16 15 6 9 + / + 5 + = 22",
      "16 15 6 9 + / 5 + + = 22",
      "16 15 9 + 6 + 5 / + = 22",
      "16 15 9 - + 6 5 - * = 22",
      "16 15 9 - + 6 5 - / = 22",
      "16 15 9 - 5 - * 6 + = 22",
      "16 15 9 - 5 - / 6 + = 22",
      "16 15 9 - 5 - 6 * + = 22",
      "16 15 9 - 6 / + 5 + = 22",
      "16 15 9 - 6 / 5 + + = 22",
      "16 15 9 - 6 5 - * + = 22",
      "16 15 9 - 6 5 - / + = 22",
      "16 15 9 5 + - * 6 + = 22",
      "16 15 9 5 + - / 6 + = 22",
      "16 15 9 5 + - 6 * + = 22",
      "16 15 9 6 + + 5 / + = 22",
      "16 15 9 6 + / + 5 + = 22",
      "16 15 9 6 + / 5 + + = 22",
      "16 15 9 6 5 - * - + = 22",
      "16 15 9 6 5 - / - + = 22",
      "16 5 + 15 6 - 9 / + = 22",
      "16 5 + 15 6 9 + / + = 22",
      "16 5 + 15 9 - 6 / + = 22",
      "16 5 + 15 9 6 + / + = 22",
      "16 5 + 6 15 9 - / + = 22",
      "16 5 + 6 9 + 15 / + = 22",
      "16 5 + 9 15 6 - / + = 22",
      "16 5 + 9 6 + 15 / + = 22",
      "16 5 + 9 6 - / 15 + = 22",
      "16 5 15 6 - 9 / + + = 22",
      "16 5 15 6 9 + / + + = 22",
      "16 5 15 9 - 6 / + + = 22",
      "16 5 15 9 6 + / + + = 22",
      "16 5 6 * + 15 - 9 - = 22",
      "16 5 6 * + 15 9 + - = 22",
      "16 5 6 * + 9 - 15 - = 22",
      "16 5 6 * + 9 15 + - = 22",
      "16 5 6 * 15 - + 9 - = 22",
      "16 5 6 * 15 - 9 - + = 22",
      "16 5 6 * 15 9 + - + = 22",
      "16 5 6 * 9 - + 15 - = 22",
      "16 5 6 * 9 - 15 - + = 22",
      "16 5 6 * 9 15 + - + = 22",
      "16 5 6 15 9 - / + + = 22",
      "16 5 6 9 + 15 / + + = 22",
      "16 5 9 15 6 - / + + = 22",
      "16 5 9 6 + 15 / + + = 22",
      "16 6 + 15 5 - 9 - * = 22",
      "16 6 + 15 5 - 9 - / = 22",
      "16 6 + 15 5 9 + - * = 22",
      "16 6 + 15 5 9 + - / = 22",
      "16 6 + 15 9 - 5 - * = 22",
      "16 6 + 15 9 - 5 - / = 22",
      "16 6 + 15 9 5 + - * = 22",
      "16 6 + 15 9 5 + - / = 22",
      "16 6 - 15 5 / + 9 + = 22",
      "16 6 - 15 5 / 9 + + = 22",
      "16 6 - 9 + 15 5 / + = 22",
      "16 6 - 9 15 5 / + + = 22",
      "16 6 15 + 9 + 5 / + = 22",
      "16 6 15 5 - 9 - * + = 22",
      "16 6 15 5 - 9 - / + = 22",
      "16 6 15 5 / - - 9 + = 22",
      "16 6 15 5 9 + - * + = 22",
      "16 6 15 5 9 + - / + = 22",
      "16 6 15 9 + + 5 / + = 22",
      "16 6 15 9 - / + 5 + = 22",
      "16 6 15 9 - / 5 + + = 22",
      "16 6 15 9 - 5 - * + = 22",
      "16 6 15 9 - 5 - / + = 22",
      "16 6 15 9 5 + - * + = 22",
      "16 6 15 9 5 + - / + = 22",
      "16 6 5 * + 15 - 9 - = 22",
      "16 6 5 * + 15 9 + - = 22",
      "16 6 5 * + 9 - 15 - = 22",
      "16 6 5 * + 9 15 + - = 22",
      "16 6 5 * 15 - + 9 - = 22",
      "16 6 5 * 15 - 9 - + = 22",
      "16 6 5 * 15 9 + - + = 22",
      "16 6 5 * 9 - + 15 - = 22",
      "16 6 5 * 9 - 15 - + = 22",
      "16 6 5 * 9 15 + - + = 22",
      "16 6 5 - * 15 + 9 - = 22",
      "16 6 5 - * 15 9 - + = 22",
      "16 6 5 - * 9 - 15 + = 22",
      "16 6 5 - / 15 + 9 - = 22",
      "16 6 5 - / 15 9 - + = 22",
      "16 6 5 - / 9 - 15 + = 22",
      "16 6 5 - 15 * + 9 - = 22",
      "16 6 5 - 15 * 9 - + = 22",
      "16 6 5 - 15 9 - * + = 22",
      "16 6 5 - 9 * - 15 + = 22",
      "16 6 9 + 15 + 5 / + = 22",
      "16 6 9 + 15 / + 5 + = 22",
      "16 6 9 + 15 / 5 + + = 22",
      "16 6 9 15 + + 5 / + = 22",
      "16 9 + 15 5 / + 6 - = 22",
      "16 9 + 6 - 15 5 / + = 22",
      "16 9 + 6 15 5 / - - = 22",
      "16 9 - 15 + 6 5 - * = 22",
      "16 9 - 15 + 6 5 - / = 22",
      "16 9 - 15 6 5 - * + = 22",
      "16 9 - 15 6 5 - / + = 22",
      "16 9 - 5 6 * + 15 - = 22",
      "16 9 - 5 6 * 15 - + = 22",
      "16 9 - 6 * 15 - 5 - = 22",
      "16 9 - 6 * 15 5 + - = 22",
      "16 9 - 6 * 5 - 15 - = 22",
      "16 9 - 6 * 5 15 + - = 22",
      "16 9 - 6 5 * + 15 - = 22",
      "16 9 - 6 5 * 15 - + = 22",
      "16 9 - 6 5 - * 15 + = 22",
      "16 9 - 6 5 - / 15 + = 22",
      "16 9 - 6 5 - 15 * + = 22",
      "16 9 15 + 6 + 5 / + = 22",
      "16 9 15 5 / + + 6 - = 22",
      "16 9 15 5 / + 6 - + = 22",
      "16 9 15 6 + + 5 / + = 22",
      "16 9 15 6 - / + 5 + = 22",
      "16 9 15 6 - / 5 + + = 22",
      "16 9 6 + 15 + 5 / + = 22",
      "16 9 6 + 15 / + 5 + = 22",
      "16 9 6 + 15 / 5 + + = 22",
      "16 9 6 - + 15 5 / + = 22",
      "16 9 6 - 15 5 / + + = 22",
      "16 9 6 15 + + 5 / + = 22",
      "16 9 6 15 5 / - - + = 22",
      "16 9 6 5 - * - 15 + = 22",
      "16 9 6 5 - / - 15 + = 22",
      "5 15 6 - 9 / + 16 + = 22",
      "5 15 6 - 9 / 16 + + = 22",
      "5 15 6 9 + / + 16 + = 22",
      "5 15 6 9 + / 16 + + = 22",
      "5 15 9 - 6 / + 16 + = 22",
      "5 15 9 - 6 / 16 + + = 22",
      "5 15 9 6 + / + 16 + = 22",
      "5 15 9 6 + / 16 + + = 22",
      "5 16 + 15 6 - 9 / + = 22",
      "5 16 + 15 6 9 + / + = 22",
      "5 16 + 15 9 - 6 / + = 22",
      "5 16 + 15 9 6 + / + = 22",
      "5 16 + 6 15 9 - / + = 22",
      "5 16 + 6 9 + 15 / + = 22",
      "5 16 + 9 15 6 - / + = 22",
      "5 16 + 9 6 + 15 / + = 22",
      "5 16 + 9 6 - / 15 + = 22",
      "5 16 15 6 - 9 / + + = 22",
      "5 16 15 6 9 + / + + = 22",
      "5 16 15 9 - 6 / + + = 22",
      "5 16 15 9 6 + / + + = 22",
      "5 16 6 15 9 - / + + = 22",
      "5 16 6 9 + 15 / + + = 22",
      "5 16 9 15 6 - / + + = 22",
      "5 16 9 6 + 15 / + + = 22",
      "5 6 * 15 - 16 + 9 - = 22",
      "5 6 * 15 - 16 9 - + = 22",
      "5 6 * 15 - 9 - 16 + = 22",
      "5 6 * 15 16 9 - - - = 22",
      "5 6 * 15 9 + - 16 + = 22",
      "5 6 * 15 9 + 16 - - = 22",
      "5 6 * 16 + 15 - 9 - = 22",
      "5 6 * 16 + 15 9 + - = 22",
      "5 6 * 16 + 9 - 15 - = 22",
      "5 6 * 16 + 9 15 + - = 22",
      "5 6 * 16 15 - + 9 - = 22",
      "5 6 * 16 9 - + 15 - = 22",
      "5 6 * 9 - 15 - 16 + = 22",
      "5 6 * 9 - 16 + 15 - = 22",
      "5 6 * 9 - 16 15 - + = 22",
      "5 6 * 9 15 + - 16 + = 22",
      "5 6 * 9 15 + 16 - - = 22",
      "5 6 * 9 16 15 - - - = 22",
      "5 6 15 9 - / + 16 + = 22",
      "5 6 15 9 - / 16 + + = 22",
      "5 6 9 + 15 / + 16 + = 22",
      "5 6 9 + 15 / 16 + + = 22",
      "5 9 15 6 - / + 16 + = 22",
      "5 9 15 6 - / 16 + + = 22",
      "5 9 6 + 15 / + 16 + = 22",
      "5 9 6 + 15 / 16 + + = 22",
      "6 15 + 9 + 5 / 16 + = 22",
      "6 15 5 - 9 - * 16 + = 22",
      "6 15 5 - 9 - / 16 + = 22",
      "6 15 5 - 9 - 16 * + = 22",
      "6 15 5 9 + - * 16 + = 22",
      "6 15 5 9 + - / 16 + = 22",
      "6 15 5 9 + - 16 * + = 22",
      "6 15 9 + + 5 / 16 + = 22",
      "6 15 9 - / 16 + 5 + = 22",
      "6 15 9 - / 16 5 + + = 22",
      "6 15 9 - / 5 + 16 + = 22",
      "6 15 9 - / 5 16 + + = 22",
      "6 15 9 - 5 - * 16 + = 22",
      "6 15 9 - 5 - / 16 + = 22",
      "6 15 9 - 5 - 16 * + = 22",
      "6 15 9 5 + - * 16 + = 22",
      "6 15 9 5 + - / 16 + = 22",
      "6 15 9 5 + - 16 * + = 22",
      "6 16 + 15 5 - 9 - * = 22",
      "6 16 + 15 5 - 9 - / = 22",
      "6 16 + 15 5 9 + - * = 22",
      "6 16 + 15 5 9 + - / = 22",
      "6 16 + 15 9 - 5 - * = 22",
      "6 16 + 15 9 - 5 - / = 22",
      "6 16 + 15 9 5 + - * = 22",
      "6 16 + 15 9 5 + - / = 22",
      "6 16 15 5 - 9 - * + = 22",
      "6 16 15 5 - 9 - / + = 22",
      "6 16 15 5 9 + - * + = 22",
      "6 16 15 5 9 + - / + = 22",
      "6 16 15 9 - 5 - * + = 22",
      "6 16 15 9 - 5 - / + = 22",
      "6 16 15 9 5 + - * + = 22",
      "6 16 15 9 5 + - / + = 22",
      "6 16 9 - * 15 - 5 - = 22",
      "6 16 9 - * 15 5 + - = 22",
      "6 16 9 - * 5 - 15 - = 22",
      "6 16 9 - * 5 15 + - = 22",
      "6 5 * 15 - 16 + 9 - = 22",
      "6 5 * 15 - 16 9 - + = 22",
      "6 5 * 15 - 9 - 16 + = 22",
      "6 5 * 15 16 9 - - - = 22",
      "6 5 * 15 9 + - 16 + = 22",
      "6 5 * 15 9 + 16 - - = 22",
      "6 5 * 16 + 15 - 9 - = 22",
      "6 5 * 16 + 15 9 + - = 22",
      "6 5 * 16 + 9 - 15 - = 22",
      "6 5 * 16 + 9 15 + - = 22",
      "6 5 * 16 15 - + 9 - = 22",
      "6 5 * 16 9 - + 15 - = 22",
      "6 5 * 9 - 15 - 16 + = 22",
      "6 5 * 9 - 16 + 15 - = 22",
      "6 5 * 9 - 16 15 - + = 22",
      "6 5 * 9 15 + - 16 + = 22",
      "6 5 * 9 15 + 16 - - = 22",
      "6 5 * 9 16 15 - - - = 22",
      "6 5 - 15 * 16 + 9 - = 22",
      "6 5 - 15 * 16 9 - + = 22",
      "6 5 - 15 * 9 - 16 + = 22",
      "6 5 - 15 16 + * 9 - = 22",
      "6 5 - 15 16 + 9 - * = 22",
      "6 5 - 15 16 9 - + * = 22",
      "6 5 - 15 9 - * 16 + = 22",
      "6 5 - 15 9 - 16 + * = 22",
      "6 5 - 16 * 15 + 9 - = 22",
      "6 5 - 16 * 15 9 - + = 22",
      "6 5 - 16 * 9 - 15 + = 22",
      "6 5 - 16 15 + * 9 - = 22",
      "6 5 - 16 15 + 9 - * = 22",
      "6 5 - 16 15 9 - + * = 22",
      "6 5 - 16 9 - * 15 + = 22",
      "6 5 - 16 9 - 15 + * = 22",
      "6 9 + 15 + 5 / 16 + = 22",
      "6 9 + 15 / 16 + 5 + = 22",
      "6 9 + 15 / 16 5 + + = 22",
      "6 9 + 15 / 5 + 16 + = 22",
      "6 9 + 15 / 5 16 + + = 22",
      "6 9 15 + + 5 / 16 + = 22",
      "9 15 + 16 6 - 5 / - = 22",
      "9 15 + 6 + 5 / 16 + = 22",
      "9 15 16 6 - 5 / - + = 22",
      "9 15 5 / + 16 + 6 - = 22",
      "9 15 5 / + 16 6 - + = 22",
      "9 15 5 / + 6 - 16 + = 22",
      "9 15 5 / 16 + + 6 - = 22",
      "9 15 5 / 16 + 6 - + = 22",
      "9 15 5 / 16 6 - + + = 22",
      "9 15 6 + + 5 / 16 + = 22",
      "9 15 6 - / 16 + 5 + = 22",
      "9 15 6 - / 16 5 + + = 22",
      "9 15 6 - / 5 + 16 + = 22",
      "9 15 6 - / 5 16 + + = 22",
      "9 16 + 15 5 / + 6 - = 22",
      "9 16 + 6 - 15 5 / + = 22",
      "9 16 + 6 15 5 / - - = 22",
      "9 16 15 5 / + + 6 - = 22",
      "9 16 15 5 / + 6 - + = 22",
      "9 16 6 - + 15 5 / + = 22",
      "9 16 6 - 15 5 / + + = 22",
      "9 16 6 - 5 / - 15 + = 22",
      "9 16 6 15 5 / - - + = 22",
      "9 6 + 15 + 5 / 16 + = 22",
      "9 6 + 15 / 16 + 5 + = 22",
      "9 6 + 15 / 16 5 + + = 22",
      "9 6 + 15 / 5 + 16 + = 22",
      "9 6 + 15 / 5 16 + + = 22",
      "9 6 - 15 5 / + 16 + = 22",
      "9 6 - 15 5 / 16 + + = 22",
      "9 6 - 16 + 15 5 / + = 22",
      "9 6 - 16 15 5 / + + = 22",
      "9 6 15 + + 5 / 16 + = 22",
      "9 6 15 5 / - - 16 + = 22"
    ]
  end

  def solution_3
    [
      "((22 - 9) * 4 - 20) / 4 = 8",
      "((22 - 9) * 4 - 20) / 4 = 8",
      "(20 + 22 * 4) / 9 - 4 = 8",
      "(20 + 22 * 4) / 9 - 4 = 8",
      "(20 + 4 * 22) / 9 - 4 = 8",
      "(20 + 4 * 22) / 9 - 4 = 8",
      "(20 - 4) * 9 / (22 - 4) = 8",
      "(20 - 4) * 9 / (22 - 4) = 8",
      "(20 - 4) / ((22 - 4) / 9) = 8",
      "(20 - 4) / ((22 - 4) / 9) = 8",
      "(20 - 9) * (4 * 4) / 22 = 8",
      "(20 - 9) * (4 * 4) / 22 = 8",
      "(20 - 9) * 4 * 4 / 22 = 8",
      "(20 - 9) * 4 * 4 / 22 = 8",
      "(20 - 9) * 4 / 22 * 4 = 8",
      "(20 - 9) * 4 / 22 * 4 = 8",
      "(22 * 4 + 20) / 9 - 4 = 8",
      "(22 * 4 + 20) / 9 - 4 = 8",
      "(22 * 4 + 4 - 20) / 9 = 8",
      "(22 * 4 + 4 - 20) / 9 = 8",
      "(22 * 4 - (20 - 4)) / 9 = 8",
      "(22 * 4 - (20 - 4)) / 9 = 8",
      "(22 * 4 - 20 + 4) / 9 = 8",
      "(22 * 4 - 20 + 4) / 9 = 8",
      "(22 * 4 - 20) / 4 - 9 = 8",
      "(22 * 4 - 20) / 4 - 9 = 8",
      "(4 * (22 - 9) - 20) / 4 = 8",
      "(4 * (22 - 9) - 20) / 4 = 8",
      "(4 * 22 + 20) / 9 - 4 = 8",
      "(4 * 22 + 20) / 9 - 4 = 8",
      "(4 * 22 + 4 - 20) / 9 = 8",
      "(4 * 22 + 4 - 20) / 9 = 8",
      "(4 * 22 - (20 - 4)) / 9 = 8",
      "(4 * 22 - (20 - 4)) / 9 = 8",
      "(4 * 22 - 20 + 4) / 9 = 8",
      "(4 * 22 - 20 + 4) / 9 = 8",
      "(4 * 22 - 20) / 4 - 9 = 8",
      "(4 * 22 - 20) / 4 - 9 = 8",
      "(4 + (22 * 4 - 20)) / 9 = 8",
      "(4 + (22 * 4 - 20)) / 9 = 8",
      "(4 + (4 * 22 - 20)) / 9 = 8",
      "(4 + (4 * 22 - 20)) / 9 = 8",
      "(4 + 22 * 4 - 20) / 9 = 8",
      "(4 + 22 * 4 - 20) / 9 = 8",
      "(4 + 4 * 22 - 20) / 9 = 8",
      "(4 + 4 * 22 - 20) / 9 = 8",
      "(4 - 22 / (20 - 9)) * 4 = 8",
      "(4 - 22 / (20 - 9)) * 4 = 8",
      "20 + (4 / 4 + 9) - 22 = 8",
      "20 + (4 / 4 + 9) - 22 = 8",
      "20 + (9 + 4 / 4) - 22 = 8",
      "20 + (9 + 4 / 4) - 22 = 8",
      "20 + 4 / 4 + 9 - 22 = 8",
      "20 + 4 / 4 + 9 - 22 = 8",
      "20 + 4 / 4 - (22 - 9) = 8",
      "20 + 4 / 4 - (22 - 9) = 8",
      "20 + 9 + 4 / 4 - 22 = 8",
      "20 + 9 + 4 / 4 - 22 = 8",
      "20 + 9 - (22 - 4 / 4) = 8",
      "20 + 9 - (22 - 4 / 4) = 8",
      "20 + 9 - 22 + 4 / 4 = 8",
      "20 + 9 - 22 + 4 / 4 = 8",
      "20 - (22 - (4 / 4 + 9)) = 8",
      "20 - (22 - (4 / 4 + 9)) = 8",
      "20 - (22 - (9 + 4 / 4)) = 8",
      "20 - (22 - (9 + 4 / 4)) = 8",
      "20 - (22 - 4 / 4 - 9) = 8",
      "20 - (22 - 4 / 4 - 9) = 8",
      "20 - (22 - 9 - 4 / 4) = 8",
      "20 - (22 - 9 - 4 / 4) = 8",
      "20 - (22 - 9) + 4 / 4 = 8",
      "20 - (22 - 9) + 4 / 4 = 8",
      "22 - (20 + 4 * 9) / 4 = 8",
      "22 - (20 + 4 * 9) / 4 = 8",
      "22 - (20 + 9 * 4) / 4 = 8",
      "22 - (20 + 9 * 4) / 4 = 8",
      "22 - (4 * 9 + 20) / 4 = 8",
      "22 - (4 * 9 + 20) / 4 = 8",
      "22 - (9 * 4 + 20) / 4 = 8",
      "22 - (9 * 4 + 20) / 4 = 8",
      "4 * ((20 - 9) * 4 / 22) = 8",
      "4 * ((20 - 9) * 4 / 22) = 8",
      "4 * ((20 - 9) * 4) / 22 = 8",
      "4 * ((20 - 9) * 4) / 22 = 8",
      "4 * (20 - 9) * 4 / 22 = 8",
      "4 * (20 - 9) * 4 / 22 = 8",
      "4 * (20 - 9) / 22 * 4 = 8",
      "4 * (20 - 9) / 22 * 4 = 8",
      "4 * (4 * (20 - 9) / 22) = 8",
      "4 * (4 * (20 - 9) / 22) = 8",
      "4 * (4 * (20 - 9)) / 22 = 8",
      "4 * (4 * (20 - 9)) / 22 = 8",
      "4 * (4 - 22 / (20 - 9)) = 8",
      "4 * (4 - 22 / (20 - 9)) = 8",
      "4 * (4 / (22 / (20 - 9))) = 8",
      "4 * (4 / (22 / (20 - 9))) = 8",
      "4 * 4 * (20 - 9) / 22 = 8",
      "4 * 4 * (20 - 9) / 22 = 8",
      "4 * 4 / (22 / (20 - 9)) = 8",
      "4 * 4 / (22 / (20 - 9)) = 8",
      "4 / (22 / (20 - 9)) * 4 = 8",
      "4 / (22 / (20 - 9)) * 4 = 8",
      "4 / 4 + (20 + 9 - 22) = 8",
      "4 / 4 + (20 + 9 - 22) = 8",
      "4 / 4 + (20 + 9) - 22 = 8",
      "4 / 4 + (20 + 9) - 22 = 8",
      "4 / 4 + (20 - (22 - 9)) = 8",
      "4 / 4 + (20 - (22 - 9)) = 8",
      "4 / 4 + (9 + 20 - 22) = 8",
      "4 / 4 + (9 + 20 - 22) = 8",
      "4 / 4 + (9 + 20) - 22 = 8",
      "4 / 4 + (9 + 20) - 22 = 8",
      "4 / 4 + (9 - (22 - 20)) = 8",
      "4 / 4 + (9 - (22 - 20)) = 8",
      "4 / 4 + 20 + 9 - 22 = 8",
      "4 / 4 + 20 + 9 - 22 = 8",
      "4 / 4 + 20 - (22 - 9) = 8",
      "4 / 4 + 20 - (22 - 9) = 8",
      "4 / 4 + 9 + 20 - 22 = 8",
      "4 / 4 + 9 + 20 - 22 = 8",
      "4 / 4 + 9 - (22 - 20) = 8",
      "4 / 4 + 9 - (22 - 20) = 8",
      "9 * (20 - 4) / (22 - 4) = 8",
      "9 * (20 - 4) / (22 - 4) = 8",
      "9 + (20 + 4 / 4) - 22 = 8",
      "9 + (20 + 4 / 4) - 22 = 8",
      "9 + (4 / 4 + 20) - 22 = 8",
      "9 + (4 / 4 + 20) - 22 = 8",
      "9 + 20 + 4 / 4 - 22 = 8",
      "9 + 20 + 4 / 4 - 22 = 8",
      "9 + 20 - (22 - 4 / 4) = 8",
      "9 + 20 - (22 - 4 / 4) = 8",
      "9 + 20 - 22 + 4 / 4 = 8",
      "9 + 20 - 22 + 4 / 4 = 8",
      "9 + 4 / 4 + 20 - 22 = 8",
      "9 + 4 / 4 + 20 - 22 = 8",
      "9 + 4 / 4 - (22 - 20) = 8",
      "9 + 4 / 4 - (22 - 20) = 8",
      "9 - (22 - (20 + 4 / 4)) = 8",
      "9 - (22 - (20 + 4 / 4)) = 8",
      "9 - (22 - (4 / 4 + 20)) = 8",
      "9 - (22 - (4 / 4 + 20)) = 8",
      "9 - (22 - 20 - 4 / 4) = 8",
      "9 - (22 - 20 - 4 / 4) = 8",
      "9 - (22 - 20) + 4 / 4 = 8",
      "9 - (22 - 20) + 4 / 4 = 8",
      "9 - (22 - 4 / 4 - 20) = 8",
      "9 - (22 - 4 / 4 - 20) = 8"
    ]
  end
end
