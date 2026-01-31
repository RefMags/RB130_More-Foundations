def process_data
  data = [['a', 1], ['b', 2], ['c', 3]]

  result = data.map do |sub_arr|
    yield(sub_arr[0], sub_arr[1], sub_arr[2])
  end

  p result
end

process_data do |char, num|
  p "#{char}: #{num}"
end
