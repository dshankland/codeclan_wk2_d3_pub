require('minitest/autorun')
require('minitest/rg')
require_relative('../customer')
require_relative('../pub')
require_relative('../drink')

class CustomerTest < MiniTest::Test

  def setup()
    @customer1 = Customer.new("Darren", 20, 16)
    @drink1 = Drink.new("Guiness", 4)
    # @drink1 = Drink.new("Guiness", 4)
    # @drink2 = Drink.new("St. Mungo", 4)
    # @drink3 = Drink.new("Tequila", 3)
    # @drinks = [@drink1, @drink2, @drink3]
    @pub1 = Pub.new('Howlin Wolf', 1000, [@drink1])

  end

  def test_get_customer_details()
    assert_equal("Darren", @customer1.name)
    assert_equal(20, @customer1.wallet)
    assert_equal(16, @customer1.age)
  end

  def test_can_buy_drink()
    @customer1.buy_drink(@pub1, @drink1)
    # wallet should go down
    assert_equal(16, @customer1.wallet)
    # till should go up
    assert_equal(1004, @pub1.till)
  end
end