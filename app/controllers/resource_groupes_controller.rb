class ResourceGroupesController < ApplicationController
    before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update, :destroy]
    before_action :find_resource_groupe, only: [:edit, :update, :destroy]

    def index
        @resource_groupes = ResourceGroupe.order(:name)
    end

    def edit
    end

    def update
        if @resource_groupe.update(resource_groupe_params)
            redirect_to resource_groupes_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def new
        @resource_groupe = ResourceGroupe.new
    end

    def create
        @resource_groupe = ResourceGroupe.new(resource_groupe_params)
        if @resource_groupe.save
            redirect_to resource_groupes_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @resource_groupe.destroy
        redirect_to resource_groupes_path
    end

    private

    def resource_groupe_params
        params.require(:resource_groupe).permit(:name, :description)
    end

    def find_resource_groupe
        @resource_groupe = ResourceGroupe.find(params[:id])
    end
end
