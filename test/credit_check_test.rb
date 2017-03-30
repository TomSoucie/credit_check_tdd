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

    assert_equal [8, 5, 6, 7, 9, 2, 9, 4], check.doubler
  end
  
  def test_the_checker_can_sum_the_transformed_numbers
    check = CreditCheck.new("49297354")

    assert_equal 50, check.verifier
  end

end