class ApplicationController < ActionController::Base
  # include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "Недостаточно прав"
  end
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource)
    information_systems_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
     root_path
  end
  def show2
  end

end
