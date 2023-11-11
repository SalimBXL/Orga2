class MainController < ApplicationController 
    def index
        @user = current_user
    end

    def show
    end

    private

    
end