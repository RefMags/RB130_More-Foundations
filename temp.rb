def select(array)
  index = 0
  result = []

  while index < array.size do
    current_element = array[index]
    if yield(current_element)
      result << current_element
    end
    index += 1
  end

  result
end

p select([1, 2, 3, 4, 5]) { |num| num.even? } #== [2, 4]


def select(array)
  index = 0
  result = []

  while index < array.size do
    current_element = array[index]
    if yield(current_element)
      result << current_element
    end
    index += 1
  end

  result
end

num = [1, 2, 3, 4, 5]
p select(num) { |num| num.odd? } #== [1, 3, 5]
