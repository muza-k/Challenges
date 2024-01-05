# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  i = 0
  profit = 0
  while i < prices.length-1
    pl = prices[i+1] - prices[i]
    if pl > 0
      profit = profit + pl
    end
    i = i + 1
  end
  puts profit
end

max_profit([7,1,5,3,6,4])