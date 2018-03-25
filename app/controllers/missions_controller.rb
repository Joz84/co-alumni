class MissionsController < ApplicationController
  def show
    @mission = Mission.find(params[:id])

    @user_mission = UserMission.new
  end
end
