module Supervisor
  class ResourcesController < ApplicationController
    before_action :check_role
    before_action :set_resource, only: %I[show edit update destroy]

    def index; end

    def show; end

    def new
      @resource = Resource.new
    end

    def create
      @resource = Resource.new(resource_params)
      return render :new unless @resource.save
      redirect_to supervisor_resource_path(@resource)
    end

    def edit; end

    def update; end

    def destroy; end

    private

    def check_role
      return if current_user.supervisor?
      redirect_to root_path
    end

    def set_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource)
            .permit(:name, :description, :user_id, :kind, :photo)
    end
  end
end
