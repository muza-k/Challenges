# @param {Integer[]} prices
# @return {Integer}

def max_profit(prices)
  return 0 if prices.empty?

  min_price = prices[0]
  max_profit = 0

  prices.each do |price|
    min_price = [min_price, price].min
    max_profit = [max_profit, price - min_price].max
  end

  max_profit
end


prices = [1, 2]
puts max_profit(prices)