class ChatroomsController < ApplicationController

  def index 
    @chatrooms = Chatroom.where(project_owner: current_user.project_owner).or(Chatroom.where(developer: current_user.developer))
  end
  
  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
  end
  
  def find_and_redirect
    if current_user.role == "Developer"
      @developer = current_user.developer
      @project = Project.find(params[:project_id])
      @chatroom = Chatroom.find_by(developer: @developer, project: @project)
    else
      @project_owner = current_user.project_owner
      @developer = Developer.find(params[:developer_id])
      @project = current_user.project_owner.projects.find(1)
      @chatroom = Chatroom.find_by(developer: @developer, project: @project)
    end
    
    if @chatroom.nil?
      raise
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
