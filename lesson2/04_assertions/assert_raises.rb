require 'minitest/autorun'

require_relative 'car'

class CarTest < Minitest::Test
  def test_raises_initialize_with_arg
    assert_raises(ArgumentError) do
      Car.new(name: 'Joey')
    end
  end
end
