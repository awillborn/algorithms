def quicksort (array)
  # no need to sort any further if the array has length 1
  return array if array.length <= 1
  # select a random pivot point in the array
  pivot = array.delete_at(rand(array.length))
  # divide the remaining numbers in the array between 
  # those that are less than the pivot, and those that
  # are greater than the pivot
  lesser, greater = array.partition { |num| num < pivot }
  # put the pivot point in the middle
  # and quicksort each of the other arrays
  return quicksort(lesser)+ [pivot] + quicksort(greater)
end