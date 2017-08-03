class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
    if params[:search]
      @authors = Author.search(params[:search]).order("name ASC").paginate(:page => params[:page], :per_page => 20)
    else
      @authors = Author.all.order("name ASC").paginate(:page => params[:page], :per_page => 20)
    end
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to authors_path
    else
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private
    def author_params
      params.require(:author).permit(:name, :biography)
    end

    def find_author
      @author = Author.find(params[:id])
    end
end
