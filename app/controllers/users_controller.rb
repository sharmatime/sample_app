class UsersController < ApplicationController
  
	def show
    	@user = User.find(params[:id])
    	#params will reteieve using the user :id
    	#the user id is passed from the URL request
    	#If url = users/1 then id passed is 1
	end

  	def new
  		@user = User.new
  		#creates an intance of an empty user object from our User model
  		#for the Users new view, which gets passes as an arguement to 
  		#form_for. Form_for creates the HTML fields to assign attributes
  		#to the empty @user.  
  	end

  	def create
  		@user = User.new(secure_params)
  		if @user.save
        sign_in @user
        flash[:success] = "Welcome to the Sample App!"
  			redirect_to @user
  		else
  			render 'new'
  		end
  	end

  	private

  		def secure_params 
  			params.require(:user).permit(:name, :email, :password, 
  										 :password_confirmation)
  		end
end
