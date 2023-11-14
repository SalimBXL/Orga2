module ApplicationHelper

    def getHeatMapColor(data)
        res = "blue" if data[:job][:code].present? && data[:job][:ampm]
        res = "lightblue" if data[:job][:code].present? && !data[:job][:ampm]
        res = "red" if data[:absence][:code].present? && !data[:absence][:valide]
        res = "green" if data[:absence][:code].present? && data[:absence][:valide]
        return res
    end
end
