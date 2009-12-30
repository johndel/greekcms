class AdminController < ApplicationController
	layout "admin"
	before_filter :login_required

	
	def index
		@pages = Page.find(:all, :order => :position, :from => "pages WHERE id > 2")
	end
	
	def sort
		params[:pages].each_with_index do |id, index|
			Page.update_all(['position=?',index+1],['id=?',id])
		end
		expire_all_pages
	end
	
	def configuration
		@page = Page.find(1)
		@email=User.find(1).email
	end
				
end
	
