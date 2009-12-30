class PagesController < ApplicationController
	layout :choose_layout #Στον application controller
	caches_page :show 
	before_filter :login_required, :except => [:show, :search]
	cache_sweeper :page_sweeper, :only => [:create, :update, :destroy]

	
	def index
		redirect_to :action => :show, :id => 3
	end
	
	def show
		if params[:permalink]
			@page = Page.find_by_permalink(params[:permalink])
		else
			@page = Page.find(params[:id])
		end
		bootstrap_page
	end
	
	def new
		@page = Page.new
	end
	
	def create
		@page = Page.new(params[:page])
		if @page.save
    		flash[:notice] = 'H σελίδα δημιουργήθηκε με επιτυχία.'
        	redirect_to :controller => :admin
    	else
        	render :action => "new"
    	end
	end
		
	def edit
		@page = Page.find(params[:id])
	end
	
	def visual_edit
		@page = Page.find(params[:id])
		bootstrap_page		
	end
		
	def update
    	@page = Page.find(params[:id])
    	if @page.update_attributes(params[:page])
     		flash[:notice] = 'H σελίδα ανανεώθηκε με επιτυχία.'
       		redirect_to :controller => :admin
    	else
       		render :action => "edit"
    	end
    	if params[:email]
    		@user = User.find(1)
			@user.email = params[:email]
			@user.save
		end	
	end
	
	def destroy
		@page = Page.find(params[:id])
    	@page.destroy
    	redirect_to :controller => :admin
	end
	
	def search
		@page = Page.find(2)
		if params[:search]
			@search_value = params[:search]
			@search_results = Page.name_like_or_title_like_or_meta_description_like_or_meta_keywords_like_or_permalink_like_or_description_like(params[:search])
		end
		bootstrap_page
	end
	
	

	
end
