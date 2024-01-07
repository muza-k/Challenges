# @param {Integer[]} height
# @return {Integer}
def max_area(heights)
  length = heights.size
  p1 = 0
  p2 = length-1
  max_area = 0

  while p1 < p2
    start_height = heights[p1]
    end_height = heights[p2]
    area = [start_height, end_height].min * (p2-p1)
    puts "Area between #{start_height} and #{end_height} is #{area}, distance - #{p2-p1}"
    max_area = area if area > max_area

    if heights[p1] < heights[p2]
      p1 = p1 + 1
    else
      p2 = p2 - 1
    end
  end

  max_area

end

heights = [1,8,6,2,5,4,8,3,7]
puts max_area(heights)