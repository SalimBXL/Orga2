class ResourcesController < ApplicationController
    before_action :authenticate_user!, only: [:index]
    before_action :find_resource, only: [:show]

    def index
        if groupe
            @groupe = ResourceGroupe.find(groupe)
            @resources = Resource.here.where(groupe: groupe).order(:groupe_id, :service_id, :name)
        else 
            @resources = Resource.here.order(:groupe_id, :service_id, :name)
        end
    end

    def show
    end

    private

    def resource_params
        params.require(:resource).permit(:name, :description)
    end

    def groupe
        params[:groupe] || nil
    end

    def find_resource
        @resource = Resource.here.find(params[:id])
    end
end
