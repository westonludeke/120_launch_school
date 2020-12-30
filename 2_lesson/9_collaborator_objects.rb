class Library
  def initialize
    @books = []
  end
  def add_book(book)
    @books << book
  end
end
class Book
  def initialize(title)
    @title = title
  end
end
my_library = Library.new
p my_library    # => #<Library:0x00000000c76050 @books=[]>
book_1 = Book.new('The Grapes of Wrath')
my_library.add_book(book_1)
p my_library    # => #<Library:0x00000001cedff0 @books=[#<Book:0x00000001cede10 @title="The Grapes of Wrath">]>
