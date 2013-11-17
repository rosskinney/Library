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
         puts "#{book.title} by #{book.author} is checked out by #{book.borrower}"
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

  def add_book(book)
    @books << book
    puts "#{book.title} was added"
  end


  def check_out(user, book)
    if book.status == "available" && user.borrowed_books_count < 2 
       user.borrowed_books_count +=1
       user.borrowed << book
       book.status = "unavailable"
       puts "The following book #{book.title} has been checked out by #{user.name}"
    else
        puts "Sorry, this book is either unavailable or you have alread checkout out two books"
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
