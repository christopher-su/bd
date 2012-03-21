class InquiryMailer < ActionMailer::Base
  default :from => "BrosisDesign-webmaster<brosisdesign.webmaster@gmail.com>"

  def have_new_inquiry(inquiry)
    @inquiry = inquiry
    mail(:to => "BrosisDesign.info@gmail.com,BrosisDesign.sales@gmail.com,Brosisdesign.design@gmail.com,Brosisdesign.service@gmail.com", :subject => "Brosisdesgin have new inquiry")
  end

  def inquiry_comfirm(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => "We have received your inquiry")
  end

end
