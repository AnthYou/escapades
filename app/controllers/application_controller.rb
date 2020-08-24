class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # CAREFUL: it is not the ApplicationSController. Ne pas touchao.
end
