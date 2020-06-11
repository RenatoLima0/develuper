class ChatroomsController < ApplicationController


  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

    def create
      @chatroom = Chatroom.new(project_params)
      project_owner = ProjectOwner.create(user_id: current_user.id)
  
      @chatroom.project_owner = project_owner
      if @project.save
        redirect_to @chatroom, notice: 'Create Sucessfully'
      else
        render 'new'
      end
    end

  
end
