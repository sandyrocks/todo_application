class UsersController < ApplicationController
  
    
    def index 
      
    end
    def new 
    @user=User.new
    end
         
 
  
  def create
    @user=User.new(params[:user])
    if @user.save
      redirect_to log_in_path, :notice=> " You are Successfully Signed up"
    else
       render "new"
    end
  end
  
  def update
    @user=User.find_by_id(session[:user_id])
    if @user.update_attributes(params[:user])
      redirect_to show_up_path, :notice =>"Data has been updated" 
    end
  end
 
 


end
