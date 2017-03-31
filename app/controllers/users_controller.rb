class UsersController < ApplicationController

	#GET
	def index
		@users = User.all
		render json: {usuarios: @users, total: User.count}, status: 200
	end

	#PUT
	#FALTA LO DE LA ID
	def create
		if params[:user][:id]
				render json: {error: "No se puede crear usuario con id"}, status: 400
		else 				
		    @user = User.new(user_params)
			if @user.save
				render json: @user.to_json, status: 201
			else 
				render json: { error: "La creación ha fallado" }, status: 500
    		end
		end
		#@user = User.new(user_params)
		#if @user.save
		#	render json: @user.to_json, status: 201
		#else 
		#	render json: { error: "La creación ha fallado" }, status: 500
    	#end
	end

	#GET/ID
	def show
		@user = User.where(id: params[:id]).first
		if @user			
	    	render json: @user.to_json, status: 200
    	else
      		render json: { error: "Usuario no encontrado" }, status: 404
    	end
		
	end

	#POST/ID
	#FALTA LO DEL ID
	def update
		@user = User.where(id: params[:uid]).first
		if @user		
			if params[:user][:id]
				render json: {error: "id no es modificable"}, status: 400
			else 				
		    	if @user.update_attributes(user_params)
		      		render json: @user, status: 200
		      	else
		      		render json: { error: "La modificación ha fallado" }, status: 500
		      	end
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
