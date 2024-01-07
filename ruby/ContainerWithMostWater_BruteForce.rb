# @param {Integer[]} height
# @return {Integer}
def max_area(heights)
  p1 = 0
  p2 = 1
  length = heights.size
  max_area = 0

  if length == 2
    return heights.min * 1
  end

  while p1 < length - 2
    # Get start height, end height, get min of heights
    start_height = heights[p1]
    end_height = heights[p2]
    height = [start_height, end_height].min
    # Get distance between 2
    distance = p2-p1
    # get total area
    area = distance * height
    max_area = area if (max_area < area)

    #puts "Area between #{heights[p1]} and #{heights[p2]} is #{area}"
    # increment p2
    p2 = p2 + 1
    # if p2 reached end, increment p1 and set p2 accordingly
    if (p2 == length)
      p1 = p1 + 1
      p2 = p1 + 1
    end
  end

  max_area

end

heights = [1,8,6,2,5,4,8,3,7]
puts max_area(heights)