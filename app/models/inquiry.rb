class Inquiry < ActiveRecord::Base

  validates :name,:presence => true
  validates :email,:presence => true,:email_format => true
  #validates :phone,:presence => true,:phone_format => true
  
end
