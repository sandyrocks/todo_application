class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end
  
  def create
    
    @category = Category.new(params[:category])
    @category.user_id =  session[:user_id]

    if @category.save
      redirect_to tasks_path, :notice=> " Category is created "
    else
       render "new"
    end
  end
  
  def displayTask
    
  end
  
end
  
  
