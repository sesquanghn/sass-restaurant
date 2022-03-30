# frozen_string_literal: true

class V1::Users::Auth::SessionsController < DeviseTokenAuth::SessionsController
  include Errors::ExceptionRescue

  after_action :after_login, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # def render_create_success
  #   resource_data = resource_data(resource_json: @resource.token_validation_response)
  #   user_id = resource_data["id"]
  #   @user = User.find(user_id)
  #   render 'v1/users/show', formats: :json
  # end

  # def render_destroy_success
  #   # FIXME: メッセージを適切にlocalesを利用して表示させる
  #   render json: { message: 'ログアウトしました' }, status: 200
  # end

  private

  def after_login
    response.headers['X-Restaurant-Tenant-Id'] = restaurant_tenant_id
  end

  def restaurant_tenant_id
    request.headers['X-Restaurant-Tenant-Id'].presence
  end

  def render_create_success
    data = @resource.token_validation_response
    account_id = Account.find_by(id: @resource.id)&.id
    resource_data_res = resource_data(resource_json: data).merge(account_id: account_id)
    render json: {
      data: resource_data_res,
      success: true,
      message: 'Logged in successfully',
      errors: '',
      code: 201
    }, status: 201
  end

  def render_create_error_bad_credentials
    render json: {
      data: {},
      success: false,
      message: I18n.t('devise_token_auth.sessions.bad_credentials'),
      errors: I18n.t('devise.sessions.bad_credentials', scope: [:errors, :codes], locale: :api),
      code: 401
    }, status: 401
  end

  def render_create_error_inactive
    render json: {
      data: {},
      success: false,
      message: I18n.t('devise_token_auth.sessions.inactive'),
      errors: I18n.t('devise.sessions.inactive', scope: [:errors, :codes], locale: :api),
      code: 401
    }, status: 401
  end

  def render_destroy_success
    render json: {
      data: {},
      success: true,
      message: 'Logged out successfully',
      errors: '',
      code: 200
    }, status: 200
  end

  def render_destroy_error
    render json: {
      data: {},
      success: false,
      message: I18n.t('devise_token_auth.sessions.user_not_found'),
      errors: I18n.t('devise.sessions.user_not_found', scope: [:errors, :codes], locale: :api),
      code: 404
    }, status: 404
  end
end
