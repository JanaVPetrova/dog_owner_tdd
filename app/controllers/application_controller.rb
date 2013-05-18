class ApplicationController < ActionController::Base
  skip_before_filter :verify_authenticity_token, :only => :create
end
