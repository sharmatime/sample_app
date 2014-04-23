module SessionsHelper

	def sign_in(user)
		#when the user signs in, a new remember token is generated
		remember_token = User.new_remember_token
		#The raw token is stored in the browser 
		cookies.permanent[:remember_token] = remember_token
		#The remember_token is digested and updates user attr :remember_token
		user.update_attribute(:remember_token, User.digest(remember_token))
		#Ruby assignment. If no self. present, then current_user would
		#only be assigned as a local variable. 
		self.current_user = user
		#Since self. present ruby knows current_user = user is calling 
		#a method specifically designed to handle assignment to
		#an instance variable that will be available whereever the 
		#Sessionhelper is available. 
	end

	def signed_in?
		!current_user.nil?
	end

	#implement machinery for user navigation from page to page
	#to maintain signin status. 
	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.digest(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def sign_out
		current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end
end
