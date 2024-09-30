class BorrowsController < ApplicationController

  def new
    @borrow = BorrowRequest.new
    @book_id = Book.find(params[:id])
  end
  
  def create
    @book_id = Book.find(params[:id])
    @borrow = BorrowRequest.new(borrow_request_params)
    if @borrow.save
      redirect_to"/student/books"  
    #   =begin redirect_to nout ka "/users" ka route =end
    else
      render "/borrows/new", status: :unprocessable_entity   
    #   =begin render nout ka "users/new" so tar ka file Path, views/users/new.html.erb.  route ma hoke buu =end
    end
  end

  private
  def borrow_request_params
    params.require(:borrow).permit(:due_date, :borrow_date, :user_id, :book_id)
  end
end
