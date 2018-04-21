class SessionsController < ApplicationController
    #new method renders the login form. 
    #actions render a view file by name by default. ie sessions/new.html.erb
    def new 
    end

    

    def create
        user = User.find_by(email: params[:email]) #params is passed from the form
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_url, notice: "Log in successful!"
        else
            flash.now.alert= "Invalid email or password"
            render "new"
        end
    end

    def destroy 
        session[:user_id] = nil 
        redirect_to root_url, notice: "Log out successful!"
    end
end
