=begin
User Controller
For Inquiry Page
=end
class InquiryController < ApplicationController

  skip_before_filter :authorize,:only => [:index,:create]

  def index
    @page_title = "Inquiry Now"
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.save
      flash[:notice] = 'Successfully make inquiry ! '
      redirect_to inquiry_index_path

      Thread.new{
        InquiryMailer.have_new_inquiry(@inquiry).deliver
        InquiryMailer.inquiry_comfirm(@inquiry).deliver
      }

    else
      render :action => 'index'
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

end
