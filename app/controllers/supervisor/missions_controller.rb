module Supervisor
  class MissionsController < ApplicationController
    skip_before_action :authenticate_user!

    def new
      @mission = Mission.new
      @mission_resource = MissionResource.new
    end

    def create
      @mission = current_user.missions.new(mission_params)
      if @mission.save
        flash[:notice] = 'Mission créée avec succés'
        redirect_to mission_path(@mission)
      else
        render 'missions/show'
      end
    end

    def edit
      @mission = Mission.find(params[:id])
    end

    def update
      @mission = Mission.find(params[:id])
      if @mission.update_attributes(mission_params)
        flash[:notice] = 'Mission mise à jour avec succés'
        redirect_to mission_path(@mission)
      else
        render 'missions/show'
      end
    end

    private

    def mission_params
      params.require(:mission).permit(:name, :description, :remote_photo_url, :lastest_date, :score, mission_resources_attributes: [:id, :resource_id, :_destroy])
    end
  end
end

