def times(num)
  count = 0
  while count < num do
    yield(count) if block_given?
    count += 1
  end

  p count
end

times(4) do |num|
  puts "this is iteration #{num}"
end
