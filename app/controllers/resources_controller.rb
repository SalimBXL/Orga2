class ResourcesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_resource, only: [:edit, :update, :destroy]

    def index
        if groupe
            @groupe = ResourceGroupe.find(groupe)
            @resources = Resource.here.where(groupe: groupe).order(:groupe_id, :service_id, :name)
        else 
            @resources = Resource.here.order(:name)
        end
    end

    def new
        @resource = Resource.new
    end

    def create
        @resource = Resource.new(resource_params)
        if @resource.save
            redirect_to resources_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @resource.update(resource_params)
            redirect_to resources_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @resource.destroy
        redirect_to resources_path
    end


    private

        def resource_params
            params.require(:resource).permit(:name, :description, :service_id, :groupe_id, :referent_id)
        end

        def groupe
            params[:groupe] || nil
        end

        def find_resource
            @resource = Resource.here.find(params[:id])
        end
end
