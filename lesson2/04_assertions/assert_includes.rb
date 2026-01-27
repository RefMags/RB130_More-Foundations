require 'minitest/autorun'

require_relative 'car'

class CarTest < Minitest::Test
  def test_includes_arr
    car = Car.new
    arr = [1, 2, 3]
    arr << car
    assert_includes(arr, car)
  end
end
