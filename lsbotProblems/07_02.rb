def count(collection)
  result = 0

  collection.each do |ele|
    result += 1 if yield(ele)
  end
  result
end

p count([1, 2, 3, 4, 5]) { |value| value.odd? } == 3
p count([1, 2, 3, 4, 5]) { |value| value % 3 == 1 } == 2
p count([1, 2, 3, 4, 5]) { |value| true } == 5
p count([1, 2, 3, 4, 5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(a b c d)) { |value| value =~ /[aeiou]/ } == 1
