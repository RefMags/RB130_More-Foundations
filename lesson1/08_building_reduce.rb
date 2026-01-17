# def reduce(array, default = 0)
#   index = 0
#   accumulator = default

#   while index < array.size do
#     current_element = array[index]
#     accumulator = yield(accumulator, current_element)
#     index += 1
#   end

#   accumulator
# end

# array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass


def reduce(array, default = nil)
  index = 0

  if default.nil?
    accumulator = array[index]
    index += 1
  elsif !default.nil?
    accumulator = default
  end

  while index < array.size do
    current_element = array[index]
    puts "Current Element: #{accumulator}"
    accumulator = yield(accumulator, current_element)
    index += 1
  end

  accumulator
end


p reduce(['a', 'b', 'c']) { |acc, value| acc += value } #== 'abc'
# p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } == [1, 2, 'a', 'b']

# Initial value given
p reduce([1, 2, 3], 10) { |acc, num| acc + num } #== 25
