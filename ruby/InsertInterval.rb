# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  intervals << new_interval
  intervals = intervals.sort do |a, b|
    comparision = a[0] <=> b[0]
    comparision.zero? ? a[1] <=> b[1] : comparision
  end

  # puts "Sorted intervals -- "
  # puts intervals.inspect
  # puts "---------- "
  i = 0
  while i < intervals.length - 1
    first_interval = intervals[i]
    second_interval = intervals[i+1]
    if first_interval.last >= second_interval.first
      lower_limit = [first_interval.first, second_interval.first].min
      upper_limit = [first_interval.last, second_interval.last].max
      new_interval = [lower_limit, upper_limit]
      intervals.delete_at(i)
      intervals.delete_at(i)
      intervals.insert(i, new_interval)
    else
      i = i + 1
    end
  end

  # puts "Merged intervals"
  # puts intervals.inspect
  intervals
end


intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]]
new_interval = [4,8]
insert(intervals, new_interval)
