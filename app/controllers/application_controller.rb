class ApplicationController < ActionController::Base

    layout :set_layout

    private

        def readJsonFile(jsonFileName)
            data = File.exist?(jsonFileName) ? File.read(jsonFileName) : {}
            return JSON.parse(data, object_class: OpenStruct)
        end

        def set_layout
            if current_user&.admin?
                "admin"
            else
                "application"
            end
        end
    
end
