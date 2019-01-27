class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@book = Book.new
  	@user = User.find(params[:id])
  	#@book = Book.where(:user_id, @user.id)
  	@books = @user.books
  end
  def index
  	@book = Book.new
  	@user = current_user
    @users = User.all
    #@user = User.find(params[:id])
  end
  def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to books_path
	end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
private
		def book_params
			params.require(:book).permit(:title,:body,:user_id,)
		end
    def user_params
      params.require(:user).permit(:name, :profile_image, :int)
    end
end