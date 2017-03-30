class UsersController < ApplicationController

	#GET
	def index
		@users = User.all
		render json: @users, status: :ok		
	end

	#PUT
	def create
		@user = User.new(user_params)
		@user.save
		render json: @user, status: :created
	end

	#GET/ID
	def show
		@user = User.where(id: params[:id]).first
		render json: @user, status: :ok
	end

	#POST/ID
	def update
    	@user = User.where(id: params[:id]).first
    	if @user.update(user_params)
        	render json: @user, status: :ok
    	else
        	render json: { errors: @user.errors }, status: 422
    	end
  	end

	#DELETE
	def destroy
		@user = User.where(id: params[:id]).first
		if @user.destroy
			head(:ok)
		else
			head(:unprocessable_entity)
		end		
	end

	private

	def user_params
		params.require(:user).permit(:nombre, :apellido, :usuario, :twitter )
	end

end
