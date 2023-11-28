class MainController < ApplicationController 
    before_action :authenticate_user!, only: [:show]

    def index
        @user = current_user
    end

    def show
        daysOff = {
            "2023-04-10": { date: "2023-04-10", name: "Pâques" },
            "2023-05-01": { date: "2023-05-01", name: "Travail" },
            "2023-05-18": { date: "2023-05-18", name: "Ascension" },
            "2023-05-29": { date: "2023-05-29", name: "Pentecôte" },
            "2023-07-21": { date: "2023-07-21", name: "Fête Nationale" },
            "2023-08-15": { date: "2023-08-15", name: "Assomtion" },
            "2023-11-01": { date: "2023-11-01", name: "Toussaint" },
            "2023-12-25": { date: "2023-12-25", name: "Noël" }
        }
        dataYear = {
            "2023-11-27": { 
                date: "2023-11-27", 
                job: {
                    am: {code: ["5"]},
                    pm: {}
                }, 
                absence: {
                    code: "", 
                    valide: false
                }
            },
            "2023-11-28": { 
                date: "2023-11-28", 
                job: {
                    am: { code: ["5", "L", "QC"] },
                    pm: { code: ["FDG2"] }
                }, 
                absence: {
                    code: "", 
                    valide: false
                }
            },
            "2023-11-29": { 
                date: "2023-11-29", 
                job: {
                    am: { code: [] },
                    pm: { code: [] }
                }, 
                absence: {
                    code: "", 
                    valide: false
                }
            },
            "2023-11-30": { 
                date: "2023-11-30", 
                job: {
                    am: {code: ["FDG"]},
                    pm: {}   
                }, 
                absence: {
                    code: "co", 
                    valide: true
                },
            },
            "2023-12-01": { 
                date: "2023-12-01", 
                job: {
                    am: {code: ["FDG2"]},
                    pm: {},
                    mission: false
                }, 
                absence: {
                    code: "co", 
                    valide: false
                }
            }
        }
        @data = HashWithIndifferentAccess.new(dataYear)
        @daysOff = HashWithIndifferentAccess.new(daysOff)
    end

    private
    
end