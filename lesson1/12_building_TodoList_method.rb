# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation
  def <<(task)
    raise TypeError, "Can only add Todo objects" unless task.instance_of? Todo
    @todos << task
  end
  alias_method :add, :<<

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def done?
    @todos.all? {|task| task.done? }
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def item_at(index)
    raises ArgumentError unless index

    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.each_index { |idx| mark_done_at(idx)}
  end


  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end

    self # we are interested the `TodoList` instance thus use self to refer to it.
  end

  def select
    list = TodoList.new(title)
    each do |todo|
      list.add(todo) if yield(todo)
    end

    list
  end

  # ----------- Implementing `find_by_title` --------------

  def find_by_title(title)

    @todos.find do |todo|
      yield(todo)
    end

  end

  # ----------- Implementing `all_done` --------------
  def all_done
    select do |todo|
      yield(todo)
    end
  end

  # ----------- Implementing `all_not_done` --------------
  def all_not_done
    select do |todo|
      yield(todo)
    end
  end

  # ----------- Implementing `mark_done` --------------
  def mark_done(title)
    find_by_title(title) && find_by_title.done! do |todo|
      yield(todo)
    end
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
end


# Implement the rest of the `TodoList` so that we can write this code:
# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Get chocolates")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo2 to end of list, returns list
list.add(todo2)                 # adds todo1 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.add(todo4)
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

todo1.done!
todo3.done!

list.each { |todo| todo }

result1 = list.select { |todo| todo.done? }

# puts result1

# ----------- `find_by_title` --------------
word = "Buy milk"
result2 = list.find_by_title(word) { |todo| todo if todo.title == word }

# puts result2.class


#----------- Implementing `all_done` --------------
result3 = list.all_done { |todo| todo.done? }
# puts result3


#----------- Implementing `all_not_done` --------------
result4 = list.all_not_done { |todo| !todo.done? }
# puts result4.class


#----------- Implementing `mark_done` --------------
task = "Go to gym"
result5 = list.mark_done(task) { |todo| find_by_title.done! }
puts result5

#----------- Implementing `mark_all_done` --------------

#----------- Implementing `mark_all_undone` --------------
