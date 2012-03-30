class SessionsController < ApplicationController

  skip_before_filter :authorize

  def new
  end

  def create
    if team_member = TeamMember.authenticate(params[:name],params[:password])
      session[:member_id] = team_member.id
      redirect_to pages_admin_path
    else
      redirect_to pages_home_path
    end
  end

  def destroy
    session[:member_id] = nil
    redirect_to  pages_home_path
  end

end
