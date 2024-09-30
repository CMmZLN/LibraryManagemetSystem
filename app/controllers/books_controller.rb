class BooksController < ApplicationController
  include Pagy::Backend
  include Session
  before_action :require_login

  # index
  def index
    # @books = Book.search(params[:search])
    @bookPagy, @books = pagy(Book.search(params[:search]), items: 10)
  end
  
  # Show
  def show
    @book = Book.find(params[:id])
  end

#  New
  def new
    @book = Book.new
  end 
  
  # Create
  def create
    @book = Book.new(book_params)
    if @book.save
      
      redirect_to "/admin/books"
    else
      render "/books/new", status: :unprocessable_entity 
    end
  end
  
   # Edit
   def edit
    # " parmas[:id] come from url route "
    @book = Book.find(params[:id])
    @image = @book.book_image
    @filename =@image.blob.filename.to_s if @image&.blob
  end

  #Update
  def update
    @book = Book.find(params[:book][:id])
    if @book.update(book_edit_params)
      redirect_to "/admin/books"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  # Delete 
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/admin/books", status: :see_other
    
  end


  private
  def book_params
    # ":user" come from "form_for :user"(new.html.erb)        
    params.require(:book).permit(:title, :author, :price, :pages, :publisher, :no_of_copies, :book_image) 
  end 

  private
  def book_edit_params
    params.require(:book).permit(:title, :author, :price, :pages, :publisher, :no_of_copies, :book_image)
  end 

end
