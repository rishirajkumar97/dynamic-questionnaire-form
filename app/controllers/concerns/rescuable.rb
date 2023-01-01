# frozen_string_literal: true

# Public: A mixin that provides helpers to handle common exceptions.
module Rescuable
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::BadRequest, with: :bad_request
    rescue_from ActiveRecord::RecordInvalid, with: :bad_request
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::InvalidForeignKey, with: :bad_request
    rescue_from ActiveRecord::RecordNotDestroyed, with: :bad_request
    rescue_from ActionController::ParameterMissing, with: :bad_request
    rescue_from ArgumentError, with: :bad_request
  end

  # Public: Error message when the configurations with the given parameters is not found.
  def not_found(exception)
    render_json_error(:not_found, exception.message)
  end

  # Public: Error message When there is a bad request.
  def bad_request(exception)
    render_json_error(:bad_request, exception.message)
  end

  # Public: Renders a json body with error status and message.
  def render_json_error(status, message)
    status = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.is_a? Symbol
    json = { message: message }.compact
    render json: json, status: status
  end

  # Public: Handles service errors.
  def rescue_service_error
    render status: :internal_server_error, json: { error: 'Internal Server Error' }
  end
end
