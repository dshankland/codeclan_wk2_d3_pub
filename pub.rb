class Pub

  attr_reader :name
  attr_accessor :till

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def stock_count()
    @drinks.count()
  end

  def check_age(customer)
    if customer.age >= 18
      return true
    else
      return false
    end
  end

  def sell_drink(drink, customer)
    if check_age(customer)
      @till += drink.price
      remove_from_stock(drink)
    end
  end

  def remove_from_stock(drink)
    @drinks.delete(drink)
  end

end