class ListsController < ApplicationController
  def index
    @lists = List.all
    @movies = Bookmark.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path(@lists)
  end

  def add_movie
    @list = List.find(params[:id])
    @movies = Movie.all
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
