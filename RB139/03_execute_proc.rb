def execute_proc(a_proc)
  value = "Inner"
  a_proc.call
end

value = "Outer"

my_proc = Proc.new do
  puts value
end

execute_proc(my_proc) #=> Outer
