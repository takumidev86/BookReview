class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

	def index
		@users = User.all
		@book = Book.new
	end
	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new
		# @book2 = Book.find(params[:id])
	end
	def show2
		@user = current_user
		@books = @user.books
		@book = Book.new
	end
	def edit
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to user_path(current_user)
		end
	end
	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:user] = 'You have updated user successfully.'
			redirect_to user_path(@user.id)
		else
			render 'edit'
		end
	end
	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end
end


# test