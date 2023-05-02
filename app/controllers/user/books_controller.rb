class User::BooksController < ApplicationController
  
  before_action :authenticate_user!, except: [:show, :search, :search_genre]
  
  def search
    # 空の配列を作成
    @books = []
    @title = params[:title]
    if @title.present?
      # ここでresultsに楽天APIから取得したデータを格納
      # 書籍のタイトルを検索して、一致するデータを格納するように設定
      results = RakutenWebService::Books::Book.search({
        title: @title
      })
      # この部分で楽天APIから取得したデータを@booksに格納していく
      # extract(result)についてはprivate配下に設定
      results.each do |result|
        book = Book.new(extract(result))
        @books << book
      end
    end 
    # @books内の各データをそれぞれ保存していく
    # 既に保存済みの本は除外するためにunlessの構文を採用
    @books.each do |book|
      unless Book.all.include?(book)
        book.save
      end
    end
  end
  
  def search_genre
    # 空の配列を作成
    @books = []
    @genre_id = params[:genreId]
    if @genre_id.present?
      results = RakutenWebService::Books::Book.search({
        booksGenreId: @genre_id
      })
      results.each do |result|
        book = Book.new(extract(result))
        @books << book
      end
    end
    
    @books.each do |book|
      unless Book.all.include?(book)
        book.save
      end
    end
    
  end
  
  def show
    @book = Book.find(params[:id])
    @review = current_user.reviews.find_by(book: @book)
    @review ||= Review.new(book: @book)
  end
  
  # 読みたい本リストを表示するためのメソッド
  def bookmarks
    @bookmark_books = current_customer.bookmark_books.include(:customer).order(created_at: :desc)
  end
  
  private
  # 楽天APIのデータから必要なデータを絞り込み、対応するカラムにデータを格納する
  def extract(result)
    title = result["title"]
    author = result["author"]
    isbn = result["isbn"]
    item_caption = result["itemCaption"]
    publisher_name = result["publisherName"]
    sales_date = result["salesDate"]
    medium_image_url = result["mediumImageUrl"]
    large_image_url = result["largeImageUrl"]
    {
      title: title,
      author: author,
      isbn: isbn,
      item_caption: item_caption,
      publisher_name: publisher_name,
      sales_date: sales_date,
      medium_image_url: medium_image_url,
      large_image_url: large_image_url
    }
  end
  
end
