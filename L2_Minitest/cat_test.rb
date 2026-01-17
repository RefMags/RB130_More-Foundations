require 'minitest/autorun'

require_relative 'cat'

class CatTest < Minitest::Test
  def setup
    @kitty = Cat.new('Kitty', 4)
  end

  def test_is_cat; end

  def test_name
    # assert_equal('Kitty', @kitty.name)
    # assert(@kitty.name == 'Kitty')
    # assert_equal('Milo', @kitty.name)
    # assert_equal(@kitty.name, 'Milo')
    # assert(@kitty.name == 'Milo')
    refute_equal('Kitty', @kitty.name)
  end

  def test_miaow
    # assert(@kitty.miaow.include?(' is miaowing.'))
    # assert_match(/ is miaowing\./, @kitty.miaow)
  end

  def test_raises_error
    # assert(Cat.new == ArgumentError)
  end

  # def test_is_not_purrier
  #   patch = Cat.new('Patch', 5)
  #   milo = Cat.new('Milo', 3)

  #   refute(patch.purr_factor > milo.purr_factor)
  # end
end
