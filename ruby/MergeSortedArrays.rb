# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  i = m - 1
  j = n - 1
  k = m + n - 1

  while(i > 0 || j > 0) do
    puts("Comparing #{nums1[i]} with #{nums2[j]}")
    if(nums1[i] >= nums2[j])
      nums1[k] = nums1[i]
      i = i-1
    else
      nums1[k] = nums2[j]
      j = j-1
    end
    k = k-1
  end

  # if i reaches 0, copy over j elements
  if (i <= 0)
    while(j >= 0) do
      nums1[k] = nums2[j]
      j = j-1
      k = k-1
    end
  end

  # if j reaches 0, copy over i elements
  if (j == 0)
    while(i >= 0) do
      nums1[k] = nums1[i]
      i = i-1
      k = k-1
    end
  end

  puts("Result - ")
  puts(nums1.inspect)
end

nums1 = [1,2,3,0,0,0]
m = 3
nums2 = [2,5,6]
n = 3
merge(nums1, m, nums2, n);