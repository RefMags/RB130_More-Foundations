require 'minitest/autorun'

require_relative 'car'

# there is a redundant `car = Car.new` setup; refactor.
class CarTest < Minitest::Test

  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")
    end
  end

  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end

  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end
end


# Refactored code
require 'minitest/autorun'

require_relative 'car'

class CarTest < Minitest::Test
  # note that we assign an instance variable to the new `Car` instance
  # Why?
  # --- We must access `@car` instance object not local variable
  # The mechanics of the `setup`: its called before running each test
  # The teardown method is also called after running each test too.
  def setup
    @car = Car.new
  end


  def test_car_exists
    assert(@car)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      # car = Car.new(name: "Joey")
      @car.name('Joey')
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car)
  end
end
