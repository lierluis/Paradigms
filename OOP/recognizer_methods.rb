require_relative 'sort'

class Array
  def limited?(amin, amax)
    for e in self do
      return false if amin > e || e > amax
    end
    return true
  end
  def sorted?
    inc,dec = true,true
    0.upto self.length-2 do |i|
      if self[i] > self[i+1] then inc = false end
      if self[i] < self[i+1] then dec = false end
    end
    
    if inc then return 1
    elsif dec then return -1
    else return 0 end
  end
end

### sample execution ###
arr = [1,2,3,1]
print arr, ".limited?(1, 3) = ", arr.limited?(1, 3); puts
print arr, ".limited?(1, 2) = ", arr.limited?(1, 2); puts
print arr, ".sorted? ", arr.sorted?; puts # unsorted
print arr.sort, ".sorted? ", arr.sort.sorted?; puts # increasing
print sort(arr), ".sorted? ", sort(arr).sorted?; puts; # decreasing

### output ###
# [1, 2, 3, 1].limited?(1, 3) = true
# [1, 2, 3, 1].limited?(1, 2) = false
# [1, 2, 3, 1].sorted? 0
# [1, 1, 2, 3].sorted? 1
# [3, 2, 1, 1].sorted? -1
