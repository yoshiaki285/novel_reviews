class User::BookmarksController < ApplicationController
  def create
    @bookmark = current_user.bookmarks.create(book_id: params[:book_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    @bookmark = current_user.bookmarks.find_by(book_id: @book.id)
    @bookmark.destroy
    redirect_back(fallback_location: root_path)
  end
end
