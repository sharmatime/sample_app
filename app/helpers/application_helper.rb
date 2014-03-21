module ApplicationHelper

	#returns the full title on a per-page basis. 
	def full_title(page_title) 								#method definition 
		base_title = "Ruby on Rails Tutorial Sample App" 	#variable assignment
		if page_title.empty? 								#contional flow statement with boolean test
			base_title										#return base_title (Implicit return)
		else												#control flow 
			"#{base_title} | #{page_title}"					#string interpolation
		end
	end
end
