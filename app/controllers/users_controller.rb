class UsersController < ApplicationController

	#GET
	def index
		@users = User.all
		render json: {usuarios: @users, total: User.count}, status: 200
	end

	#PUT
	#FALTA LO DE LA ID
	def create
		@user = User.new(user_params)
		if @user.save
			render json: @user, status: 201
		else 
			render json: { error: "La creación ha fallado" }, status: 500
    	end
	end

	#GET/ID
	def show
		@user = User.where(id: params[:id]).first
		if @user			
	    	render json: @user, status: 200
    	else
      		render json: { error: "Usuario no encontrado" }, status: 404
    	end
		
	end

	#POST/ID
	#FALTA LO DEL ID
	def update
		@user = User.where(id: params[:id]).first
		if @user			
	    	if @user.update(user_params)
	      		render json: @user, status: 200
	      	else
	      		render json: { error: "La modificación ha fallado" }, status: 500
	      	end
    	else
      		render json: { error: "Usuario no encontrado" }, status: 404
    	end
  	end

	#DELETE
	def destroy
		@user = User.where(id: params[:id]).first
		if @user
			if @user.destroy
				head(204)
			else
				head(:unprocessable_entity)
			end	
		else 
			render json: { error: "Usuario no encontrado" }, status: 404
		end	
	end

	private

	def user_params
		params.require(:user).permit(:nombre, :apellido, :usuario, :twitter )
	end

end
