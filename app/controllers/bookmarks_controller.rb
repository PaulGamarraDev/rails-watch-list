class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:id])
    @movie = Movie.find(params[:bookmark][:movie_id])
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

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
