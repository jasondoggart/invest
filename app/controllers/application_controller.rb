class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected  
    def after_sign_in_path_for(resource)
      user_path(current_user) || request.referer || root_path
    end
end
