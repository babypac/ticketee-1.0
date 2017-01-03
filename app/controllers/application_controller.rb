class ApplicationController < ActionController::Base
  include Pundit

  after_action :verify_authorized, except: [:index],
               unless: :devise_controller?
  after_action :verify_policy_scoped, only: [:index],
               unless: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:name, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def not_authorized
    redirect_to root_path, alert: "You aren't allowed to do that."
  end
end