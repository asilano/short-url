class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to root_path, alert: 'Record not found'
  end
end
