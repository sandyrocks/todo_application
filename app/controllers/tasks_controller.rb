class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    category_id = params[:category_id].present? ? params[:category_id] : 4
    @completed_tasks = Task.completed_tasks(session[:user_id],category_id)
    @incomplete_tasks = Task.incomplete_tasks(session[:user_id],category_id)
    
    puts request.xhr?
 
    if request.xhr?
      render :partial => 'index'
    end
  
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
        
        @user= User.find_by_id(session[:user_id])
        @task = @user.tasks.create(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
  
  
  def complete
    @task= Task.find_by_id(params[:id])
    @task.update_attributes(:completed => 1)
    @completed_tasks = Task.completed_tasks(session[:user_id])
    @incomplete_tasks = Task.incomplete_tasks(session[:user_id])
  end
  
  def category_task
    
  end
 
end
