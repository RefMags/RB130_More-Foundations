def each(array)
  index = 0
  while index < array.size do
    yield(array[index])
    # yiled(index)
    puts "index is #{index}"
    index += 1
    puts "after index incremented to #{index}"
  end

  array
end

each([1, 2, 3, 4, 5]) do |ele|
  puts ele
end
