=begin
User Controller
For Inquiry Page
=end
class InquiryController < ApplicationController

  skip_before_filter :authorize,:only => [:index,:create,:suc]

  def index
    @page_title = "Free Quote"
    @inquiry = Inquiry.new
  end

  def create
    @page_title = "Free Quote"
    @inquiry = Inquiry.new(params[:inquiry])
    @inquiry.name= "" if @inquiry.name == "Full name"
    @inquiry.email= "" if @inquiry.email == "Email address"
    @inquiry.desc= "" if @inquiry.desc == "Message"
    if @inquiry.save
      #redirect_to inquiry_index_path


      Thread.new{
        x = InquiryMailer.have_new_inquiry(@inquiry).deliver
        p 'xxxxxxxxxxxxxxxxxxxxxx'
        p x
        p 'xxxxxxxxxxxxxxxxxxxxxx'
        InquiryMailer.inquiry_comfirm(@inquiry).deliver
      }
      redirect_to suc_inquiry_index_path
    else
      #redirect_to :back
      render "index"
    end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy

    redirect_to man_inquiry_inquiry_index_path
  end

  def man_inquiry
    @inquiries = Inquiry.all
  end

  def suc

  end

end
