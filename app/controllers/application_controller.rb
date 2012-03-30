class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected
  def authorize
    unless TeamMember.find_by_id(session[:member_id])
      redirect_to pages_home_path
    end
  end

end
