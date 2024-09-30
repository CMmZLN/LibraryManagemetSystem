class UsersController < ApplicationController
  include Pagy::Backend
  include Session
  before_action :require_login, except: [:new, :create]

  
  def index
    # @users = User.search(params[:search])
    @pagy, @users = pagy(User.search(params[:search]), items: 10)
  end
      # Show
  def show
    @user = User.find(params[:id])
  end
    
  def new
    @user = User.new
  end
      # Create
  def create
    logger.info("Params")
    logger.info(params[:acc_type])
    @user = User.new(user_params)
    if @user.save
      Rails.logger.info("Hello")
      
      redirect_to"/login"  
    #   =begin redirect_to nout ka "/users" ka route =end
    else
      Rails.logger.info("Helloooo")
      Rails.logger.info(@user.errors.full_messages)
      render "/users/new", status: :unprocessable_entity   
    #   =begin render nout ka "users/new" so tar ka file Path, views/users/new.html.erb.  route ma hoke buu =end
    end
  end
      # Edit
  def edit
    # " parmas[:id] come from url route "
    @user = User.find(params[:id])
    @image = @user.profile_image
    @filename =@image.blob.filename.to_s if @image&.blob
  end
      # Update
  def update
    logger.info("Params ID")
    logger.info(params[:user][:id])
    @user = User.find(params[:user][:id])

    if @user.update(user_edit_params)
      redirect_to "/admin/students"
    else
      logger.info("Params ID")
      logger.info(@user.errors.full_messages)
      render :edit, status: :unprocessable_entity
    end
  end
    # destroy
  def destroy
    Rails.logger.info(params[:id])
    @user = User.find(params[:id])
    
    @user.destroy
    redirect_to "/admin/students", status: :see_other
    
  end

  private
  def user_params
    # ":user" come from "form_for :user"(new.html.erb)        
    params.require(:user).permit(:name, :email, :password, :gender, :tel, :roll_no, :profile_image) 

  end 

  private
  def user_edit_params
    params.require(:user).permit(:id, :name, :email, :tel, :profile_image)
  end 
   
end
