class BooksController < ApplicationController
  before_action :find_book, only: [:show]

  def show
  end

  private
    def find_book
      @book = Book.friendly.find(params[:id])
    end
end
