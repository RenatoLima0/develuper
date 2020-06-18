class ChatroomsController < ApplicationController

  def index 
    if current_user.project_owner != nil
      @chatrooms = Chatroom.where(project: current_user.project_owner.projects)
    else
      @chatrooms = Chatroom.where(developer: current_user.developer)
    end
  end
  
  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
  end
  
  def find_and_redirect
    if params[:project_id] && current_user.developer
      @developer = current_user.developer
     
      @project = Project.find(params[:project_id])
      @chatroom = Chatroom.find_by(developer: @developer, project: @project)
    elsif params[:developer_id] && current_user.project_owner
      @project_owner = current_user.project_owner
      @developer = Developer.find(params[:developer_id])
      @project = current_user.project_owner.projects.first
      @chatroom = Chatroom.find_by(developer: @developer, project: @project)
    else 
      redirect_to root_path, alert: "You're not allowed to do that" and return

    end
    
    if @chatroom.nil?

      @chatroom = Chatroom.create(developer: @developer, project: @project)
    end

    redirect_to @chatroom
  end
  
  def new
    @chatroom = Chatroom.new
  end
  
  def create
    @chatroom = Chatroom.new(project_params)
    # project_owner = ProjectOwner.create(user_id: current_user.id)
    # project_owner = current_user.id

    @chatroom.project_owner = project_owner
    if @project.save
      redirect_to @chatroom, notice: 'Create Sucessfully'
    else
      render 'new'
    end
  end

  
end
