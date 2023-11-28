class ApplicationController < ActionController::Base
    before_action :current_user

    private

    def readJsonFile(jsonFileName)
        data = File.exist?(jsonFileName) ? File.read(jsonFileName) : {}
        return JSON.parse(data, object_class: OpenStruct)
    end

    def authenticate_user!
        redirect_to root_path, alert: "You must be logged in to do that." unless user_signed_in?
    end

    def redirect_if_authenticated
        redirect_to root_path, alert: "You are already logged in." if user_signed_in?
    end

    def current_user
        Current.user ||= authenticate_user_from_session
    end
    helper_method :current_user
    

    def authenticate_user_from_session
        User.find_by(id: session[:user_id])
    end


    def user_signed_in?
        current_user.present?
    end
    helper_method :user_signed_in?


    def login(user)
        Current.user = user
        reset_session
        session[:user_id] = user.id
    end


    def logout(user)
        Current.user = nil
        reset_session
    end


    def print_session_var(text = nil)
        puts " "
        puts " "
        puts "*****************************"
        puts "#{text}"
        puts "SESSION : "
        session.keys.each do |key|
            puts "SESSION[:#{key}] = #{session[key]}"
        end
        puts "*****************************"
        puts " "
    end

end
