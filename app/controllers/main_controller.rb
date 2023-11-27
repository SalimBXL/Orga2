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
            },
            "2023-11-17": { 
                date: "2023-11-17", 
                job: {
                    code: "5",
                    ampm: false
                }, 
                absence: {
                    code: "co", 
                    valide: true
                }
            },
            "2023-11-20": { 
                date: "2023-11-20", 
                job: {
                    code: "5",
                    ampm: false
                }, 
                absence: {
                    code: "", 
                    valide: false
                }
            },
            "2023-11-21": { 
                date: "2023-11-21", 
                job: {
                    code: "M",
                    ampm: false
                }, 
                absence: {
                    code: "", 
                    valide: false
                }
            },
            "2023-11-22": { 
                date: "2023-11-22", 
                job: {
                    code: "5",
                    ampm: false
                }, 
                absence: {
                    code: "", 
                    valide: false
                }
            },
            "2023-11-23": { 
                date: "2023-11-23", 
                job: {
                    code: "M",
                    ampm: false
                }, 
                absence: {
                    code: "", 
                    valide: false
                }
            },
            "2023-11-24": { 
                date: "2023-11-24", 
                job: {
                    code: "",
                    ampm: false
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