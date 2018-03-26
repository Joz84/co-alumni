class MissionsController < ApplicationController
  def show
    @mission = Mission.find(params[:id])
    @user_missions_booked = current_user.user_missions.same_mission_booked(@mission)
    @user_mission = UserMission.new
  end

end
