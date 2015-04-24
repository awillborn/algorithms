class Array
  def recursive_binary_search(number, left=0, right=nil)
    right = self.length - 1 unless right
    mid = (left + right) / 2

    # The number does not exist in the array
    return nil if left > right

    if number == self[mid]
      return mid
    elsif number > self[mid]
      # The number is on the right half of the array
      # Set left to the midpoint + 1 and keep right equal to the length of the array
      # in order to search only the right half of the array
      recursive_binary_search(number, mid + 1, right)
    elsif number < self[mid]
      # The number is on the left half of the array
      # Keep left at 0, and set right to the midpoint - 1
      # in order to search only the left half the array
      recursive_binary_search(number, left, mid - 1)
    end
  end
end

my_array = [1,2,3,4,5,6,7]
puts(my_array.recursive_binary_search(2) == 1)
puts(my_array.recursive_binary_search(4) == 3)

my_array = [1,2,3,4,5,6]
puts(my_array.recursive_binary_search(5) == 4)
puts(my_array.recursive_binary_search(8) == nil)