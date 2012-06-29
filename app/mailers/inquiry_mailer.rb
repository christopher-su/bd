class InquiryMailer < ActionMailer::Base
 # default :from => "BrosisDesign-webmaster<brosisdesign.webmaster@gmail.com>"
 default :from => "BrosisDesign-webmaster<BrosisDesign.info@gmail.com>"

  def have_new_inquiry(inquiry)
    @inquiry = inquiry
    mail(:to => "BrosisDesign.sales@gmail.com",:cc => "BrosisDesign.info@gmail.com,Brosisdesign.design@gmail.com,Brosisdesign.service@gmail.com" ,:subject => "Brosisdesgin have new inquiry")
  end

  def inquiry_comfirm(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => "Thanks for your inquiry")
  end

end
