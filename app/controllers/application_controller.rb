class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: { error: exception.message }, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: { error: exception.message }, status: :bad_request
  end
end
