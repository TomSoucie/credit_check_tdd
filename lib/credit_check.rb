require 'pry'

class CreditCheck
  
  def initialize(number)
    @number = number
  end

  def string_converter
    @number.chars.map(&:to_i)
  end

  def reverser
    string_converter.reverse
  end

  def doubler
    doubled = []
    reverser.each_with_index do |num, i|
      if i.odd?
        if (num * 2) >= 10
          doubled << (num*2).to_s.split("").map(&:to_i).reduce(&:+)
        else
          doubled << num * 2
        end
      else
        doubled << num
      end
    end
    doubled
  end

  def verifier
    doubler.reduce(&:+)
  end

  def validator
    verifier % 10 == 0 ? true : false
  end

  def printer
    return "Number is valid!" if validator == true 
    return "Number is invalid!" if validator == false
  end

end