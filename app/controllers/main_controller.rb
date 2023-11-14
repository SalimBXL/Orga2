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

        data = {
            "2023-01-19": { 
                date: "2023-01-19", 
                job: {
                    code: "",
                    ampm: true
                }, 
                absence: {
                    code: "co", 
                    valide: true
                }
            },
            "2023-02-14": { 
                date: "2023-02-14", 
                job: {
                    code: "5",
                    ampm: true
                }, 
                absence: {
                    code: "", 
                    valide: false
                }
            },
            "2023-02-21": { 
                date: "2023-02-21", 
                job: {
                    code: "fdg",
                    ampm: false
                }, 
                absence: {
                    code: "", 
                    valide: false
                }
            },
            "2023-03-24": { 
                date: "2023-03-24", 
                job: {
                    code: "",
                    ampm: true
                }, 
                absence: {
                    code: "co", 
                    valide: false
                }
            }
        }
        @data = HashWithIndifferentAccess.new(data)
    end

    private
    
end