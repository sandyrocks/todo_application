class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end
  
  def create
    @user=Category.new(params[:category])
    if @user.save
      redirect_to tasks_path, :notice=> " Category is created "
    else
       render "new"
    end
  end
  
  def displayTask
    
  end
  
end
  
  
