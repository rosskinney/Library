class Library
  def initialize
    @books = []
  end

  # def books
  # end

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
    puts "The following book #{book.title} has been checked out by #{user.name}"
  end

  def check_in(book)
  end
end

class Borrower
  attr_reader :name
  def initialize(name)
    @name = name
    puts "#{name} was created "
  end

  def borrowed_books
  end

  # def name
  #   @name.each do |name|
  #     puts book.title
  #   end

  # end

  def borrowed_books_count
  end

  def borrowed_books_list
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
