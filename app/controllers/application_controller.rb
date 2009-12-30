# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  	def choose_layout
		if action_name == 'show' || action_name == 'search' || action_name == 'visual_edit'
			return :content
		else
			return :admin
		end
	end
		
	def bootstrap_page
		@search_value = "Αναζήτηση..." if @search_value == "" || @search_value.nil?
		@all_pages = Page.find(:all, :order => :position, :from => "pages WHERE id > 2 AND active = true") # Για το μενού
		@default = Page.find(1)
		@title = @default.title
		@meta_keywords = @default.meta_keywords
		@meta_description = @default.meta_description
		@description = @default.description
		if @page.title != ""
	   		@title = @page.title
		end
		if @page.meta_keywords != ""
	   		@meta_keywords = @page.meta_keywords 
		end
		if @page.meta_description != ""
	  		@meta_description = @page.meta_description
		end
		unless @page.active
			render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
		end
	end
	
	def expire_all_pages # Για το caching, σβήνει τις σελίδες στο public
		exclude =["404.html", "422.html", "500.html", "robots.txt", "favicon.ico"]
		basedir = "#{RAILS_ROOT}/public"
		all_files = Dir.new(basedir).entries
		cache=all_files.clone
		all_files.each do |y| 
			exclude.each do |x|
				unless ((x != y) and (y.match(/\S+\.\S+/)))
					cache.delete(y)
				end	
			end
		end
		cache.each do |cache_page|
			File.delete("#{RAILS_ROOT}/public/#{cache_page}")			
		end
		
	end

def rescue_action_in_public(exception)
		render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
	end
	
	
	
	
end
