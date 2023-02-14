class CashRegister
  attr_reader :discount
  attr_accessor :total
  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = {}
    @prices = []
  end

  def items
    result = []
    @items.each do |key, value|
      value.times { result << key }
    end
    result
  end
  def add_item(title, price, quantity=1)
    item_total = price * quantity
    if @items.has_key?(title)
      @items[title] += quantity
    else
      @items[title] = quantity
    end
    @prices << item_total
    self.total += item_total
  end
  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total *= (1 - @discount/100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  def void_last_transaction
    @items.delete(@items.keys.last) # delete the last value
    last_value = @prices.pop # pop last price
    @total -= last_value
  end
end