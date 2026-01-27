require 'minitest/autorun'

require_relative 'car'

class CarTest < Minitest::Test
  def test_name
    car = Car.new
    assert_nil(car.name)
  end
end
