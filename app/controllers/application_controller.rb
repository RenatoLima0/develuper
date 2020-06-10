class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :dispatch_user


  def dispatch_user
    return unless current_user && request.get?

      path = new_profile_path unless current_user.valid?
    # path = dashboards_path if request.path == root_path

# raise
#     path = new_profile_path unless current_user.valid?
#     if current_user.role == "Developer" 
#       path = projects_path
#     else
#       path = new_project_path
#     end
      redirect_to path unless path.nil? || path == request.path
  end

  
  # def after_sign_in_path_for()
  #   if self.current_user.role == "Developer"
  #     root_path
  #   else
  #     projects_path
  #   end
  # end
end