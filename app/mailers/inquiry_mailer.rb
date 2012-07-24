class InquiryMailer < ActionMailer::Base
 #default :from => "BrosisDesign-webmaster<brosisdesign.webmaster@gmail.com>"
  default :from => "BrosisDesign-webmaster<system@brosisdesign.com>"

  def have_new_inquiry(inquiry)
    @inquiry = inquiry
    mail(:to => "sales@brosisdesign.com",:cc => "design@brosisdesign.com" ,:subject => "Brosisdesgin have new inquiry")
  end

  def inquiry_comfirm(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => "Thanks for your inquiry")
  end

end
