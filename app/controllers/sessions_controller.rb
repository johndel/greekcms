class SessionsController < ApplicationController
 layout "login"
	def index
		render :new
	end
	
	  def new
	  	if logged_in?
	  		redirect_to :controller => :admin, :action => :index
  		end
	  end
	  
	  def create
	    user = User.authenticate(params[:login], params[:password])
	    if user
	      session[:user_id] = user.id
	      flash[:notice] = "Επιτυχής σύνδεση."
	      redirect_to :controller => :admin, :action => :index
	    else
	      flash.now[:error] = "Εσφαλμένο ψευδώνυμο ή κωδικός."
	      render :action => 'new'
	    end
	  end
	  
	  def destroy
	    session[:user_id] = nil
	    flash[:notice] = "Επιτυχής αποσύνδεση."
	    redirect_to root_url
	  end
	end
