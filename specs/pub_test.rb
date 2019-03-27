require('minitest/autorun')
require('minitest/rg')
require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class PubTest < MiniTest::Test

  def setup()
    @drink1 = Drink.new("Guiness", 4)
    @drink2 = Drink.new("St. Mungo", 4)
    @drink3 = Drink.new("Tequila", 3)
    @drink4 = Drink.new("Guiness", 4)
    @drink5 = Drink.new("Guiness", 4)
    @drink6 = Drink.new("Guiness", 4)
    @drinks = [@drink1, @drink2, @drink3, @drink4, @drink5, @drink6]
    @pub1 = Pub.new('Howlin Wolf', 1000, @drinks)
    @customer1 = Customer.new("Darren", 20, 21)
    @customer2 = Customer.new("Danny", 20, 16)
  end

  def test_get_pub_details()
    assert_equal("Howlin Wolf", @pub1.name)
    assert_equal(1000, @pub1.till)
    assert_equal(6, @pub1.stock_count())
  end

  def test_remove_from_stock()
    @pub1.remove_from_stock(@drink1)
    assert_equal(5, @pub1.stock_count())
  end

  def test_customer_age()
    assert_equal(true, @pub1.check_age(@customer1))
  end

  def test_can_sell_drink()
    @pub1.sell_drink(@drink1, @customer1)
    assert_equal(1004, @pub1.till)
    assert_equal(5, @pub1.stock_count())
  end

  def test_cannot_sell_drink()
    @pub1.sell_drink(@drink1, @customer2)
    assert_equal(1000, @pub1.till)
    assert_equal(6, @pub1.stock_count())
  end

end