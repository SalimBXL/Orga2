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

        
        dataWeek = {
            "1": { job: { code: "5", ampm: true }, absence: { code: "", valide: false } },
            "2": { job: { code: "M", ampm: true, mission: true }, absence: { code: "", valide: false } },
            "3": { job: { code: "", ampm: true }, absence: { code: "ma", valide: true } },
            "4": { job: { code: "", ampm: true }, absence: { code: "co", valide: false } },
            "5": { job: { code: "FDG2", ampm: false }, absence: { code: "", valide: false } },
            "6": { job: { code: "", ampm: true }, absence: { code: "", valide: false } }
        }
        dataYear = {
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
            "2023-03-09": { 
                date: "2023-03-09", 
                job: {
                    code: "fdg",
                    ampm: false,
                    mission: true
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
        @data = HashWithIndifferentAccess.new(dataYear)
        @myWeek = HashWithIndifferentAccess.new(dataWeek)
    end

    private
    
end