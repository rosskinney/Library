class Library
  def initialize
    @books = []
  end

  def books
  end

  def list_books
  end

  def borrowed_books
  end

  def available_books
  end

  def add_book(book)
    @books << book
  end

  def check_out(user, book)
  end

  def check_in(book)
  end
end

class Borrower
  def initialize(name)
  end

  def borrowed_books
  end

  def name
  end

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
