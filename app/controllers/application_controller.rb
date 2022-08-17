class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  NotAuthorized = Class.new(StandardError)
  TokenMissing = Class.new(StandardError)

  rescue_from Apipie::ParamMissing, with: :handle_param_missing
  rescue_from Apipie::ParamInvalid, with: :handle_param_invalid
  rescue_from ApplicationController::NotAuthorized, with: :user_not_authorized
  rescue_from ApplicationController::TokenMissing, with: :token_missing

  private

    def handle_param_missing
      title = 'Parameter Missing'
      message = $ERROR_INFO.message
      render(json: { error: { message: message, title: title } }, status: :unprocessable_entity) && return
    end

    def handle_param_invalid
      title = 'Invalid parameters'
      message = $ERROR_INFO.message
      render(json: { error: { message: message, title: title } }, status: :unprocessable_entity) && return
    end

    def user_not_authorized
      message = 'User is not authorized'
      render(json: { error: { message: message} }, status: :unauthorized) && return
    end

    def token_missing
      message = 'Token Missing'
      render(json: { error: { message: message} }, status: :unauthorized) && return
    end

end

