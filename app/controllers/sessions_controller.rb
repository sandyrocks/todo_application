class SessionsController < ApplicationController
  def new
  end
    def create
    user=User.authenticate(params[:email],params[:password])
    puts "user"
    if user
      session[:user_id]= user.id
      redirect_to tasks_url, :notice => "Logged in as #{user.email}"
    else
      flash.now.alert= "Invalid email or password"
      render "new"
    end
  end
   def destroy
    session[:user_id]=nil
    redirect_to new_session_path, :notice => "Logged out"
  end
end
