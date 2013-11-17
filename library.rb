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

  end

  def available_books
  end

  def add_book(book)
    @books << book
    puts "#{book.title} was added"
  end


  def check_out(user, book)
    puts "b4 doing anything: The following book #{book.title} has a status of #{book.status}" 
    puts "b4 doing anything: user borrowed count = #{user.borrowed_books_count}"
    if book.status == "available" && user.borrowed_books_count < 2 
       user.borrowed_books_count +=1
       user.borrowed << book
       book.status = "unavailable"
       puts "after: The following book #{book.title} has a status of #{book.status}" 
       puts "after user borrowed count = #{user.borrowed_books_count}"
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

  end

  def borrowed_books_list
    @borrowed.each do |book|
        puts "#{book.title} by #{book.author}"
    end
  end
end

class Book
  attr_reader :title, :author
  attr_accessor :status
  def initialize(title, author)
      @title = title
      @author = author
      @status = "available"
      @borrower = nil

  end
end
