class Admin::BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    if params[:search]
      @books = Book.search(params[:search]).order("title ASC").paginate(:page => params[:page], :per_page => 20)
    else
      @books = Book.all.order("title ASC").paginate(:page => params[:page], :per_page => 20)
    end
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to admin_books_path, notice: "Book was successfully saved!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to admin_books_path, notice: "Book was successfully saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to admin_books_path, alert: "Book was successfully deleted!"
  end

  private
    def book_params
      params.require(:book).permit(:title, :description, :price, :author_id, :cover)
    end

    def find_book
      @book = Book.find(params[:id])
    end
end
