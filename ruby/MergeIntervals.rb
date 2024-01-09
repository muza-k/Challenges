# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  # sort intervals
  intervals = intervals.sort do |a, b |
    comparision = a[0] <=> b[0]
    comparision.zero? ? a[1] <=> b[1] : comparision
  end
  puts "------- sorted input -------"
  puts intervals.inspect
  puts "------------------------"

  i = 0
  while i < intervals.length - 1
    interval = intervals[i]
    second_interval = intervals[i+1]
    if interval[1] >= second_interval[0]
      upper_limit = [interval[1], second_interval[1]].max
      lower_limit = [interval[0], second_interval[0]].min
      new_interval = [lower_limit, upper_limit]
      intervals.delete_at(i+1)
      intervals.delete_at(i)
      intervals.insert(i, new_interval)
    else
      i = i + 1
    end
  end

  puts intervals.inspect
  intervals
end


intervals = [[4,5],[2,4],[4,6],[3,4],[0,0],[1,1],[3,5],[2,2]]
merge(intervals)