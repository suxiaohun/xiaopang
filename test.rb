def four_sum(nums, target)
  arr = []
  nums.each do |n1|
    nums2 = nums.dup
    nums2.delete_at(nums2.index(n1))
    nums2.each do |n2|
      nums3 = nums.dup

      nums3.delete_at(nums3.index(n1))
      nums3.delete_at(nums3.index(n2))

      nums3.sort

      left = 0
      right = nums3.size - 1
      while left != right
        t = target - n1 - n2
        sum = nums3[left] + nums3[right]

        if sum == t
          temp = [n1, n2, nums3[left], nums3[right]].sort
          arr << temp
        elsif sum < t
          left += 1
        else
          right -= 1
        end
      end
    end
  end
  arr.uniq
end