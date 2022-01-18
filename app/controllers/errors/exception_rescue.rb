module Errors::ExceptionRescue
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid, ActiveModel::ValidationError, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from CanCan::AccessDenied, with: :access_denied_response
    rescue_from Timeout::Error, with: :render_timeout_error_response
    rescue_from ActiveRecord::RecordNotUnique, with: :render_record_not_unique_response
    rescue_from ActiveRecord::InvalidForeignKey, with: :render_invalid_foreign_key_response
    rescue_from ArgumentError, with: :render_argument_error_response

    def render_record_not_unique_response
      render json: {
        data: {},
        success: false,
        message: 'Validation Failed',
        errors: I18n.t('errors.codes.activerecord.invalid', locale: :api),
        code: 422
      }, status: 422
    end

    def render_unprocessable_entity_response(exception)
      render json: {
        data: {},
        success: false,
        message: 'Validation Failed',
        errors: Errors::ValidationErrorsSerializer.new(exception.try(:model) || exception.try(:record)).serialize,
        code: 422
      }, status: 422
    end

    def render_not_found_response(exception)
      render json: {
        data: {},
        success: false,
        message: "#{exception.model} not found.",
        errors: I18n.t('errors.codes.generic.not_found', locale: :api),
        code: 404
      }, status: 404
    end

    def access_denied_response
      render json: {
        data: {},
        success: false,
        message: 'Access denied. You are not authorized to access the requested page.',
        errors: I18n.t('errors.codes.generic.access_denied', locale: :api),
        code: 403
      }, status: 403
    end

    def render_error_response(exception)
      render json: {
        data: {},
        success: false,
        message: exception.message,
        errors: exception.message,
        code: exception.code
      }, status: exception.http_status
    end

    def render_timeout_error_response
      render json: {
        data: {},
        success: false,
        message: 'Request Timeout.',
        errors: I18n.t('errors.codes.generic.request_timeout', locale: :api),
        code: 408
      }, status: 408
    end

    def render_tarmed_service_invalid_response(exception)
      render json: {
        data: {},
        success: false,
        message: :failed,
        errors: exception.message,
        code: exception.code
      }, status: exception.http_status
    end

    def render_invalid_foreign_key_response
      render json: {
        data: {},
        success: false,
        message: 'This record is still referenced from other record.',
        errors: I18n.t('errors.codes.activerecord.invalid_foreign_key', locale: :api),
        code: 409
      }, status: 409
    end

    def render_argument_error_response(exception)
      render json: {
        data: {},
        success: false,
        message: :failed,
        errors: exception.message,
        code: 400
      }, status: 400
    end
  end
end
