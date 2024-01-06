def two_sum(numbers, target)
  p1 = 0
  p2 = 1
  length = numbers.size

  while p1 < length-1   # while pointer1 reaches the second element from last

    if (numbers[p1] && numbers[p2] && numbers[p1] + numbers[p2] == target)
      return [p1+1, p2+1]
    end

    if numbers[p1] == numbers[p2] && (numbers[p1] + numbers[p2] != target)
      p1 = p2
      p2 += 1
      next
    end

    if numbers[p2] == numbers[p2-1]
      p2 += 1
      next
    end

    p1_val = numbers[p1]  #get p1 value
    diff = target - p1_val  #get diff
    if numbers[p2] == diff  # if p2 is pointing to diff, return p1 & p2
      return [p1+1, p2+1]
    else                   # if p2 is not pointing to diff, increment p2
      p2 += 1
    end

    if !numbers[p2] || p2 == length || numbers[p2] > diff  # if p2 has reached last element or crosses the diff
      p1 += 1
      p2 = p1 + 1
    end
  end
end