class MainController < ApplicationController 
    def Index

        @user = current_user
    end

    private

    
end