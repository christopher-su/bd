class TeamMembersController < ApplicationController
  skip_before_filter :authorize
  def index
    @teamMembers = TeamMember.all
  end

  def new
    @teamMember = TeamMember.new
  end

  def create
    @teamMember = TeamMember.new(params[:team_member])
    if @teamMember.save
      redirect_to team_members_path
    end
  end

  def destroy
    @teamMember = TeamMember.find(params[:id])
    if @teamMember.destroy
      redirect_to team_members_path
    end
  end

end
