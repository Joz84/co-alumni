class UserMissionsController < ApplicationController

  def create
    @mission = Mission.find(params[:mission_id])
    @user_mission = @mission.user_missions.new(user:  current_user)
    if @user_mission.save
      flash[:notice] = 'Mission acceptée avec succés'
      redirect_to @mission
    else
      render 'missions/show'
    end
  end

  def update
    @user_mission = UserMission.find(params[:id])
    @user_mission.done!
    @user_mission.date = DateTime.now
    flash[:notice] = 'Mission accomplie avec succés'
    redirect_to mission_path(@user_mission.mission)
  end

end
