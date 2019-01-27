class BooksController < ApplicationController
		before_action :authenticate_user!
	def new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			flash[:notice] = "successfully"
		redirect_to books_path
		else
			flash[:notice] = "error"
			@user = current_user
			@book = Book.new
			@books = Book.all
			render action: :index
		end
	end

	def index
		@book = Book.new
		@books = Book.all
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def edit
		@book = Book.find(params[:id])
		#@user = current_user
		#@books = @user.books
		#if @books != @book
			#redirect_to user_path(current_user)
		#end
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		flash[:notice] = "successfully"
		redirect_to books_path
		else
			flash[:notice] = "error"
			render action: :edit
		end
	end


	private
		def book_params
			params.require(:book).permit(:title,:body)
		end
end



