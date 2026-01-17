# create and store a closure(Proc) in a variable
inc = Proc.new { |x| x + 1 }

# pass a closure to a method
def apply_proc(proc, value)
  proc.call(value)
end

p apply_proc(inc, 5)  # returns 6

# return a closure from a method
def make_counter
  count = 0
  Proc.new { count += 1 }
end

counter = make_counter
p counter.call  # returns 1
p counter.call  # returns 2
