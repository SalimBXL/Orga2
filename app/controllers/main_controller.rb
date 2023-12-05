class MainController < ApplicationController 

    def index
    end

    def show
        @daysOff = readJsonFile('public/days-off.json')
        @data = readJsonFile('public/data-year.json')
    end

    private
    
end