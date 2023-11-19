module ApplicationHelper

    def getHeatMapColor(data)
        res = "blue" if data[:job][:code].present? && data[:job][:ampm]
        res = "light-blue" if data[:job][:code].present? && !data[:job][:ampm]
        res = "amber" if data[:job][:code].present? && data[:job][:mission]
        res = "deep-orange" if data[:absence][:code].present? && !data[:absence][:valide]
        res = "light-green" if data[:absence][:code].present? && data[:absence][:valide]
        return res
    end
end
