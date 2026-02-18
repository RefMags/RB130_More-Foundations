def build_callbacks
  callbacks = []

  3.times do |i|
    callbacks << proc { puts "Callback ##{i}: value = #{value}" }
  end

  callbacks
end

value = 'outer'
cbs = build_callbacks
value = 'changed'

cbs.each(&:call)


# a) Without running the code, write down exactly what you expect to be printed (line by line), and justify your answer based on:
# when local variables are bound,
# how blocks / procs capture local variables (by reference vs by value),
# which value is used.
# b) Now, rewrite build_callbacks so that the same method instead “freezes” the values of i and value at the moment each callback is created. Explain precisely what change in your code changed the closure behavior.
# c) Evaluate: which version is less error‑prone in a large codebase, and why? Argue your position using Ruby’s scoping / closure rules, not just “readability”.
