def select(array)
  index = 0
  selected_elements = []

  while index < array.size do
    current_element = array[index]
    yield(current_element) ? selected_elements << current_element : nil
    index += 1
  end

  selected_elements
end

p select([1, 2, 3, 4, 5, 6]) { |value| value.odd? } # => [1, 3, 5]
