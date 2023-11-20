module ApplicationHelper

    def isWeekend?(date)
        return (date.saturday? || date.sunday?) 
    end

    def dateFirstDayOfTheCurrentWeek
        Date.today.beginning_of_week
    end

    def firstDayOfCalendar
        firstDayOfTheYear = Date.today.beginning_of_year
        dayOfWeek = firstDayOfTheYear.wday
        delta = -1 if (dayOfWeek < 1)
        delta = 0 if (dayOfWeek == 1)
        delta = (dayOfWeek - 1) if (dayOfWeek > 1)
        return firstDayOfTheYear - delta.days
    end

    def currentWeekNumber
        Date.today.strftime("%U").to_i
    end

    def weekPercent
        (currentWeekNumber / 52.00) * 100
    end

    def getDateFormated(date)
        date.strftime("%Y-%m-%d")
    end

    def getDateFrenchFormated(date)
        date.strftime("%e %B %Y, %k:%M")
    end

    def getDateFrenchFormatedWithDayName(date)
        date.strftime("%a %e %B")
    end

    def getHeatMapColor(dateJour)
        if isWeekend?(dateJour)
            bgColor = "lightgrey"
        else
            dateJourFormated = getDateFormated(dateJour)
            unless @daysOff[dateJourFormated]
                if @data[dateJourFormated]
                    bgColor = getCellColor(@data[dateJourFormated])
                else
                    bgColor = "white"
                end
            else
                bgColor = "blue-grey"
            end
        end
    end

    private

    def getCellColor(data)
        res = "blue" if data[:job][:code].present? && data[:job][:ampm]
        res = "light-blue" if data[:job][:code].present? && !data[:job][:ampm]
        res = "amber" if data[:job][:code].present? && data[:job][:mission]
        res = "deep-orange" if data[:absence][:code].present? && !data[:absence][:valide]
        res = "light-green" if data[:absence][:code].present? && data[:absence][:valide]
        return res
    end
end
