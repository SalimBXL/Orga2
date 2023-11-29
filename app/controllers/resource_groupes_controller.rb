class ResourceGroupesController < ApplicationController
    before_action :authenticate_user!, only: [:index]

    def index
        @resource_groupes = ResourceGroupe.all
    end
end
