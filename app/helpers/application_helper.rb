module ApplicationHelper

    def getDateFormated(date)
        date.strftime("%Y-%m-%d")
    end

    def getHeatMapColor(dateJour)
        if dateJour.saturday? || dateJour.sunday?
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
