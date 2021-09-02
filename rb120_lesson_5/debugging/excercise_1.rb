# display_data is called on an instance of the Library class
# display_data is an instance method that is defined in the Books class
# the instance variable books in the Library class contains book objects, there-
#  fore the instance method display_data should be called on each individual
#  Book object within the library instance variable array
#     - iterate over the instance variable books (which is an array of Book objects)
#       and call display_data on each
# Steps:
# - create display_books method that iterates over the books instance variable array
#   and calls display_data on each book object within the array

class Library
  attr_accessor :address, :phone, :books

  def initialize(address, phone)
    @address = address
    @phone = phone
    @books = []
  end

  def check_in(book)
    books.push(book)
  end

  def display_books
    books.each { |book| book.display_data }
  end 
end

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def display_data
    puts "---------------"
    puts "Title: #{title}"
    puts "Author: #{author}"
    puts "ISBN: #{isbn}"
    puts "---------------"
  end
end

community_library = Library.new('123 Main St.', '555-232-5652')
learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

community_library.check_in(learn_to_program)
community_library.check_in(little_women)
community_library.check_in(wrinkle_in_time)

community_library.display_books
