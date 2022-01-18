class V1::AuthController < V1::ApiController
  include DeviseTokenAuth::Concerns::SetUserByToken

  private

  def authenticate_v1_user!
    authenticate_v1_users_user!
  end

  def current_user
    current_v1_users_user
  end

  def render_authenticate_error
    return render json: {
      data: {},
      success: false,
      message: I18n.t('devise.failure.unauthenticated'),
      errors: I18n.t('devise.failure.unauthenticated', scope: [:errors, :codes], locale: :api),
      code: 401
    }, status: 401
  end
end
