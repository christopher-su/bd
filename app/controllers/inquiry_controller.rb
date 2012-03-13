class InquiryController < ApplicationController

  def index
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.save
      flash[:notice] = "Successfully make inquiry ! "
      redirect_to inquiry_index_path
    else
      render :action => 'index'
    end
  end

end
