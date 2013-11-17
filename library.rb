class Library
  def initialize
    @books = []
  end

  def list_books
    @books.each do |book|
      puts "The book #{book.title} is in the library catalog with a the status of " "#{book.status}"
    end
  end

  def borrowed_books
    @books.each do |book|
      if book.status == "unavailable"
         puts "#{book.title} by #{book.author} is checked out by #{book.borrower.name}"
      end
    end
  end

  def available_books
    @books.each do |book|
      if book.status == "available"
        puts "#{book.title} by #{book.author} is currently available"
      end
    end
  end
# Add a book to the book array
#
# book - The String to be added.
#
# Examples
# add_book("The Stranger", "Albert Camus")
#   # => ["The Stranger", "Albert Camus"]
#
# Returns the Array with the new book appended to the end
  def add_book(book)
    @books << book
    puts "#{book.title} was added"
  end

# Check out a book from the library
#
# Checks to see if the borrower has reached the book limit of 2
#
# Checks if the book is available to be checked out
#
# Checks out the book to the borrower
#
# Increment borrowed_books_count
#
# Adds the book to the borrowed_book array
#
# Updates book.status to unavailable
#
# Sets book.borrower to user
  def check_out(user, book)
    if user.borrowed_books_count == 2 
      puts "You already have checked out the maximum number of books"
    elsif book.status == "unavailable"
      puts "Sorry, this book is currently checked out"
    else
       user.borrowed_books_count +=1
       user.borrowed << book
       book.status = "unavailable"
       book.borrower = user
       puts "The following book #{book.title} has been checked out by #{user.name}"
    end
  end

  def check_in(book)
    puts "check in method" 
    book.status = "available"
    puts "#{book.title} has has been returned by #{book.borrower.name}"
    book.borrower.borrowed.delete(book)
    book.borrower = nil
  end
end

class Borrower
  attr_reader :name 
  attr_accessor :borrowed_books_count, :borrowed
  def initialize(name)
    @name = name
    puts "#{name} was created "
    @borrowed_books_count =  0
    @borrowed = []
  end

  def borrowed_books
    @borrowed.each do |book|
        puts "#{book.title} by #{book.author}"
    end
  end

  def borrowed_books_list
   @borrowed.each do |book|
        puts "#{book.title} by #{book.author}"
    end
  end
end

class Book
  attr_reader :title, :author
  attr_accessor :status ,:borrower
  def initialize(title, author)
      @title = title
      @author = author
      @status = "available"
      @borrower = nil
  end
end
