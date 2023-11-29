class ResourceGroupesController < ApplicationController
    before_action :authenticate_user!, only: [:index]

    def index
        @resource_groupes = ResourceGroupe.order(:name)
    end
end
