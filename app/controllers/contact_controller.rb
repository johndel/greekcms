class ContactController < ApplicationController
	before_filter :login_required, :except => [:new, :create]
	layout :contact_layout

  def index
   

  end


  def show
	 @contact = Contact.find(:all, :order => "id desc")
  end

  # GET /contact/new
  # GET /contact/new.xml
  def new
  	@contact = Contact.new
    @page = Page.find(4)
    bootstrap_page
  end

  # GET /contact/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contact
  # POST /contact.xml
  def create
    @contact = Contact.new(params[:contact])

    
     	if @contact.save
     		ContactMailer.deliver_message(@contact)
     	flash[:notice] = 'Σας ευχαριστούμε για το μήνυμα σας.'
        redirect_to :action => :new 
      else
     	flash[:error] = 'Σφάλμα αποστολής μηνύματος. Παρακαλούμε συμπληρώστε τα απαραίτητα πεδία και ξαναδοκιμάστε.'
        redirect_to :action => :new 
    end
  end

  # PUT /contact/1
  # PUT /contact/1.xml
  def update
    @contact = Contact.find(params[:id])


      if @contact.update_attributes(params[:contact])
        flash[:notice] = 'Αποθήκευση μηνύματος.'
		redirect_to :action => :show 
      else
    	render :action => "edit" 
      end

  end

  # DELETE /contact/1
  # DELETE /contact/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
	redirect_to :action => :show

  end
  
  def contact_layout
  		if action_name == 'new' || action_name == 'create'
			return :content
		else
			return :admin
		end
  	
  end
  	
  
end