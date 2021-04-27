class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    #this method returns the current user in the session, if any?
    def current_user
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end

    #checks if the user is logged in
    def logged_in?
        !!current_user
    end

    #this view authorized users to make request to a path
    def authorized 
        #if the user is not authorized, redirect to signup page
        redirect_to new_user_path unless logged_in?
    end
end
