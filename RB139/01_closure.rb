book = 'Slow Productivity'

proc_book = proc { book }

p proc_book.call

book = 'Deep Work'

p proc_book.call
