class BooksController < ApplicationController
	def top
		
	end
	def about
		
	end
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@books = Book.all
		if @book.save
		  flash[:create] = 'You have created book successfully.'
		  redirect_to book_path(@book[:id])
		else
		  render :index
		end
	end
	def edit
		@book = Book.find(params[:id])
		if @book.user != current_user
			redirect_to books_path
		end
	end

	def index
		@books = Book.all
		@book = Book.new
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			flash[:update] = 'You have updated book successfully.'
			redirect_to book_path(@book.id)
		else
			render :edit
		end
	end
	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
