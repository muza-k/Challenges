# @param {Integer[][]} points
# @return {Integer}
def find_min_arrow_shots(points)
  points = points.sort do |a, b|
    comp = a[0] <=> b[0]
    comp.zero? ? a[1] <=> b[1] : comp
  end

  #puts "Sorted Input #{points}"
  p1 = 0
  p2 = 1
  shots = 1
  range1 = (points[p1].first..points[p1].last).to_a
  while p2 < points.length
    range2 = (points[p2].first..points[p2].last).to_a

    ol_nums = overlapping_numbers(range1, range2)
    if ol_nums.length > 0
      range1 = ol_nums
      p2 = p2 + 1
    else
      shots += 1
      p1 = p2
      p2 = p2 + 1
      range1 = (points[p1].first..points[p1].last).to_a
    end
  end

  shots
end

def overlapping_numbers(range1, range2)
  result = []
  range1.each do |n|
    result << n if range2.include?(n)
  end
  result
end

points = [[1,2],[3,4],[5,6],[7,8]]
puts find_min_arrow_shots(points)