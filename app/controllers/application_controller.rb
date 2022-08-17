class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  rescue_from Apipie::ParamMissing, with: :handle_param_missing
  rescue_from Apipie::ParamInvalid, with: :handle_param_invalid

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


end

