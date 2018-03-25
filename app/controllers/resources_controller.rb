class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end

  def show
    @resource = Resource.includes(missions: :creator).find(params[:id])
  end
end
