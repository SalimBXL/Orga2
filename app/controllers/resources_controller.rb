class ResourcesController < ApplicationController
    before_action :find_resource, only: [:edit, :update, :destroy, :show]

    def index
        @groupe = ResourceGroupe.find(groupe) if groupe.present?
        @resources = Resource.here.for_groupe(groupe) if groupe.present?
        @resources = Resource.here.for_referent(current_user) if referent.present?
        @resources = Resource.here.order(:name) if (groupe.nil? and referent.nil?)
    end

    def show
        @intervs = readJsonFile('public/interventions.json')
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

        def referent
            params[:referent] || nil
        end

        def find_resource
            @resource = Resource.here.find(params[:id])
        end
end
