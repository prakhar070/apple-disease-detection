#user controller manages the users of the application
class UsersController < ApplicationController
    #before the show action, we need to make sure that the user is logged in first, the authorized helper is defined in application_controller.rb
    before_action :authorized, only: [:show]

    #displays the profile for the user
    def show
        #fetches the user from the id in hash
        @user = User.find(params[:id])
        #only passes the posts of that user to the view
        @posts = @user.posts.all
    end

    #displays the registration form
    def new
        #passes an empty user object
        @user = User.new
    end

    #creates a new user
    def create
        #creates a new user from the user params
        @user = User.create(user_params)
        if @user.save
            #if the user is saved successfully, redirect to the timeline view
            redirect_to root_path
        else
            #otherwise render another form, and display the validation errors
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
    end

end