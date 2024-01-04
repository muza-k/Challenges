# @param {Integer} n
# @return {Integer}

def climb_stairs(n)
  lookup = {}
  ways_to_climb(n, lookup)
end

def ways_to_climb(n, lookup)
  return 1 if n == 1
  return 2 if n == 2
  count1 = 0
  count2 = 0

  if(!lookup[n-1])
    count1 = ways_to_climb(n-1, lookup)
    lookup[n-1] = count1
  else
    count1 = lookup[n-1]
  end

  if(!lookup[n-2])
    count2 = ways_to_climb(n-2, lookup)
    lookup[n-2] = count2
  else
    count2 = lookup[n-2]
  end

  count1 + count2
end