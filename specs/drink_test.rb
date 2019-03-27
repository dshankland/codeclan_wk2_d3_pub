require('minitest/autorun')
require('minitest/rg')
require_relative('../drink')

class DrinkTest < MiniTest::Test

  def setup()
    @drink1 = Drink.new("Guiness", 4)
  end

  def test_get_drink_info()
    assert_equal("Guiness", @drink1.name)
    assert_equal(4, @drink1.price)
  end
end