class ApplicationController < ActionController::Base
  include Paramable
  include Rescuable

  skip_before_action :verify_authenticity_token
end
