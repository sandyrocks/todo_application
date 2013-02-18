class ApplicationController < ActionController::Base

  helper_method :current_user, :current_user_all_categories

  protect_from_forgery
    
    def current_user
      @current_user = User.find(session[:user_id]) if session[:user_id] 
    end

    def current_user_all_categories
    	current_user_all_categorie = User.find(session[:user_id]).categories if session[:user_id]
    	return current_user_all_categorie
    end

end
