class MainController < ApplicationController 
    def index
        @user = current_user
    end

    def show
        firstDayOfTheYear = Date.today.beginning_of_year
        dayOfWeek = firstDayOfTheYear.wday
        delta = -1 if (dayOfWeek < 1)
        delta = 0 if (dayOfWeek == 1)
        delta = (dayOfWeek - 1) if (dayOfWeek > 1)
        @firstDayOfCalendar = firstDayOfTheYear - delta.days 
    end

    private

    
end