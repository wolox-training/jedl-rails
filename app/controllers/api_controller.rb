class ApiController < ActionController::Base
	include DeviseTokenAuth::Concerns::SetUserByToken

	rescue_from ActiveRecord::RecordNotFound do |exception|
		render json: { error: exception.message }, status: :not_found
	end

	rescue_from ActiveRecord::RecordInvalid do |exception|
		render json: { error: exception.message }, status: :bad_request
	end
end
