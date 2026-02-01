def any?(collection)
  result = false
  collection.each do |item|
    result = true if yield(item)
    # return true if yield(item)
  end
  # false
  result
end

# The buggy method will pass this test case
# p any?([1, 3, 5, 6]) { |value| value.even? } == true

p any?([2, 4, 'cat', 8]) { |value| value.even? } == true

# p any?([2, 4, 6, 7, 8, 9]) { |value| value.odd? } == true

# The buggy method will fail this test case
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false

# # Other test cases
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([]) { |value| true } == false
