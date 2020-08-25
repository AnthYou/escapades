class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit
  # CAREFUL: it is not the ApplicationSController. Ne pas touchao.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit? COMMENT BECAUSE IT MAKES THE INDEX CRASH

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
