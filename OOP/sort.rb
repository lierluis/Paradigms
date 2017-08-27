# sort in decreasing order
def sort(v)
  arr = v.clone
  for i in 0...(arr.length - 1)
    for j in 0...(arr.length - i - 1)
      if (arr[j] < arr[j+1])
        arr[j], arr[j+1] = arr[j+1], arr[j] #swap
      end
    end
  end
  return arr
end

### sample execution ### (uncomment to see)
# array = [9,2,5,4,12,7,8,11,9,3,7,4,12,5,4,10,9,6,9,4]
# print sort(array); puts # sort array
# print array; puts # array unchanged

### output ###
# [12, 12, 11, 10, 9, 9, 9, 9, 8, 7, 7, 6, 5, 5, 4, 4, 4, 4, 3, 2]
# [9, 2, 5, 4, 12, 7, 8, 11, 9, 3, 7, 4, 12, 5, 4, 10, 9, 6, 9, 4]
