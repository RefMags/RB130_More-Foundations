def counter
  count = 0
  Proc.new { count += 1 }
end

p my_counter = counter
p my_counter.call #== 1
p my_counter.call #== 2

p another_counter = counter
p another_counter.call #== 1
p another_counter.call #== 2
