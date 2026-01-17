# capturing the value of x at the time of the Proc creation
x = 10
sum = Proc.new { |n| n + 5 }
puts sum.call(x)

# capturing the variable x after its value has changed
x = 20
puts sum.call(x) # the proc uses the current value of x


# 2. demonstrating the difference between capturing by value and by reference
def create_proc_by_value(val)
  Proc.new { val += 10 }
end

def create_proc_by_reference
  var = 10
  Proc.new { var += 10 }
end

proc_by_value = create_proc_by_value(5)
proc_by_value2 = create_proc_by_value(20)
puts proc_by_value.call  # always returns 15
puts proc_by_value.call  # always returns 25
puts proc_by_value2.call # always returns 30

proc_by_reference = create_proc_by_reference
proc_by_reference2 = create_proc_by_reference
puts proc_by_reference.call  # returns 20
puts proc_by_reference.call  # returns 30
puts proc_by_reference2.call # returns 20, independent instance
