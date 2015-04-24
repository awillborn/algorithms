def bubble_sort(array)
  for i in 2..array.length do
    iterations = array.length - i
    for i in 0..iterations do
      array[i], array[i+1] = array[i+1], array[i] if array[i] > array[i+1]
    end
  end
  return array
end

array = [8, 2, 9, 4, 3, 6, 1]
puts(bubble_sort(array) == [1, 2, 3, 4, 6, 8, 9])
