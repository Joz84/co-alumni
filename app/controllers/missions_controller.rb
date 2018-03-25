class MissionsController < ApplicationController
  def show
    @mission = Mission.find(params[:id])

    # if current_user.user_missions.find_by(mission: @mission).nil?
    #   @user_mission = UserMission.new()
    # else
    #   @user_mission = current_user.user_missions.find_by(mission_id: params[:id])
    # end
  end
end
