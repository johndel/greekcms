class UsersController < ApplicationController
  before_filter :login_required
  layout "admin"
	
  def index 
  	 @user = User.all
  end
	
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Ο χρήστης δημιουργήθηκε με επιτυχία."
      redirect_to :action => :index
    else
       flash[:error] = "Δεν τηρούνται οι απαραίτητες συνθήκες για δημιουργία του λογαριασμού."
      render :action => 'new'
    end
  end
  
  	def edit
		@user = User.find(params[:id])
	end
	
	def update
      @user = User.find(params[:id])
    	if @user.update_attributes(params[:user])
     		flash[:notice] = 'Ο χρήστης ανανεώθηκε με επιτυχία.'
       		redirect_to :action => :index
   		else
   			flash[:error] = "Δεν τηρούνται οι απαραίτητες συνθήκες για ανανέωση του λογαριασμού."
   			render :action => 'edit' 
		end
	end
	
	def destroy
		@user = User.find(params[:id])
    	@user.destroy
    	redirect_to :action => :index
	end
  
end
