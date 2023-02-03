class ApplicationController < ActionController::Base
  def current_ability
    Ability.new(current_member)
    # @current_ability ||= UserAbility.new(current_account)
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end
end
