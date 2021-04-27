# a controller to maintain sessions functionality (login)
class SessionsController < ApplicationController
    #creates a new session for the user, i.e logs in the user
    def create
        #fetches the user object by the username specified in the params hash
        @user = User.find_by(username: params[:session][:username])
        #if the user exists and the password entered by the user is correct, then grant him access and create a new session
        print "11111111111111111111111111111111111111111111111111111111111111111111111111111"
        if @user and @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            #redirect him to the timeline view
            print "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
            redirect_to root_url
        else
            print "222222222222222222222222222222222222222222222222222222222222222222222222222222"
            #if there exists any validation error, reflect via flash message
            flash.now[:error] = "Invalid email/password combination "
            #redirect again to the login page
            redirect_to new_session_path
        end
    end

    #destorys an existing session
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end
