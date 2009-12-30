class ContactMailer < ActionMailer::Base
  

  def message(contact)
    subject    contact.subject
    recipients User.find(1).email
    from       "#{contact.email}, #{contact.name}"
    sent_on    Time.now
    
    body       :message => contact
  end

end
