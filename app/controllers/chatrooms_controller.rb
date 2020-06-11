class ChatroomsController < ApplicationController


  def show
    @message = Message.new
    @chatroom = Chatroom.find(params[:id])
  end
  
  def find_and_redirect
    @developer = current_user.developer
    @project = Project.find(params[:project_id])
    @chatroom = Chatroom.find_by(developer: @developer, project: @project)
    if @chatroom.nil?
      @chatroom = Chatroom.create(developer: @developer, project: @project)
    end
    redirect_to @chatroom
  end
end
