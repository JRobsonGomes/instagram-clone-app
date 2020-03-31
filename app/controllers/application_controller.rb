class ApplicationController < ActionController::Base
  before_action :authenticate_user! #action do devise, verifica se o usuário está logado, caso contrário redireciona para página de login
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :layout_by_resource

  private

  def layout_by_resource
    "authentication" if devise_controller?
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: %i[name username]
  end
end
