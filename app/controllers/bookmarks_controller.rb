class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]
  before_action :set_movie, only: %i[create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @list.id
    @bookmark.movie_id = @movie.id
    if @bookmark.save
      redirect_to list_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:bookmark][:movie_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
