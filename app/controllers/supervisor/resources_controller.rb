module Supervisor
  class ResourcesController < ApplicationController
    before_action :check_role
    before_action :set_resource, only: %I[edit update destroy]
    before_action :set_new_resource, only: %I[new edit]
    before_action :set_new_resource_with_params, only: %I[create]

    def new; end

    def create
      return render :new unless @resource.save
      flash[:notice] = 'Ressource créée avec succés'
      redirect_to resource_path(@resource)
    end

    def edit; end

    def update
      return render :edit unless @resource.update(resource_params)
      redirect_to resource_path(@resource)
    end

    def destroy
      return redirect_to resource_path(@resource) unless @resource.destroy
      redirect_to resources_path
    end

    private

    def check_role
      return if current_user.supervisor?
      redirect_to root_path
    end

    def set_resource
      @resource = Resource.find(params[:id])
    end

    def set_new_resource
      @resource = Resource.new
    end

    def set_new_resource_with_params
      @resource = Resource.new(resource_params)
    end

    def resource_params
      params.require(:resource)
            .permit(:name, :description, :user_id, :kind_id, :photo)
    end
  end
end
