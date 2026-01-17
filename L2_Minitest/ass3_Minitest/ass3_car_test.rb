require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'ass3_car'

class CarTest < Minitest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
end
