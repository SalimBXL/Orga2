class ResourcesController < ApplicationController
    before_action :authenticate_user!, only: [:index]

    def index
        @resources = Resource.all
    end
end
