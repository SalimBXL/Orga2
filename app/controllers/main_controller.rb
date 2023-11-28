class MainController < ApplicationController 
    before_action :authenticate_user!, only: [:show]

    def index
        @user = current_user
    end

    def show
        @daysOff = readJsonFile('public/days-off.json')
        @data = readJsonFile('public/data-year.json')
    end

    private
    
end