class InquiryMailer < ActionMailer::Base
  default :from => "BrosisDesign.com<brosisdesign.service@gmail.com>"

  def have_new_inquiry(inquiry)
    @inquiry = inquiry
    mail(:to => "scchristopher.su@gmail.com,BrosisDesign.sales@gmail.com", :subject => "Brosisdesgin have new inquiry")
  end

  def inquiry_comfirm(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => "We have received your inquiry")
  end

end
