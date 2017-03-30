gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/credit_check'

class CreditCheckTest < Minitest::Test
  def test_the_credit_check_is_an_instance
    check = CreditCheck.new("4929735477250543")

    assert_instance_of CreditCheck, check 
  end

  def test_the_checker_can_convert_input_to_array_of_numbers
    check = CreditCheck.new("4929")
    
    assert_equal [4, 9, 2, 9], check.string_converter
  end

  def test_the_input_is_reversed_before_doubling
    check = CreditCheck.new("4929")

    assert_equal [9, 2, 9, 4], check.reverser
  end
  
  def test_the_checker_can_double_every_other_with_double_digits_added
    check = CreditCheck.new("49297354")

    assert_equal [4, 1, 3, 5, 9, 4, 9, 8], check.doubler
  end
  
  def test_the_checker_can_sum_the_transformed_numbers
    check = CreditCheck.new("49297354")

    assert_equal 43, check.verifier
  end

  def test_the_checker_can_check_a_valid_and_invalid_card
      check = CreditCheck.new("4929735477250543")

      assert check.validator

      bouncy_check = CreditCheck.new("4929735477250544")
      
      refute bouncy_check.validator
  end

  def test_the_checker_prints_statement_for_true_and_false
    check = CreditCheck.new("4929735477250543")

    assert_equal "Number is valid!", check.printer

    bouncy_check = CreditCheck.new("4929735477250544")

    assert_equal "Number is invalid!", bouncy_check.printer
  end

end