class Contact < ActiveRecord::Base
set_table_name 'contact'
validates_format_of :email,:with => /^(\S+)@(\S+).(\S+)$/
validates_presence_of :subject
validates_presence_of :body 
end
