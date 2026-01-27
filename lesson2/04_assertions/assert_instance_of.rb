require 'minitest/autorun'

require_relative 'car'

class CarTest < Minitest::Test
  def test_instance_of
    car = Car.new
    assert_instance_of(Car, car)
  end
end
