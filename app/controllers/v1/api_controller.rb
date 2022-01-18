class V1::ApiController < ActionController::API
  include ::ActionView::Layouts
  include Errors::ExceptionRescue
  layout 'v1/application'

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :remove_session

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name])
  end

  private

  def remove_session
    request.session_options[:skip] = true
  end

  def tenant_to_header(account)
    response.headers['X-Restaurant-Tenant-Id'] = account.subdomain
  end

  def load_schema
    Apartment::Tenant.switch!('public')
    return if request.path.eql?('/v1/accounts')

    if current_account
      Apartment::Tenant.switch!(current_account.subdomain)
      tenant_to_header(current_account)
    else
      render json: { message: 'account not exists!' }
    end
  end

  def current_account
    subdomain = request.headers['X-Restaurant-Tenant-Id']
    subdomain = request.headers['X-Company-Name'] if request.headers['X-Company-Name'].present?
    @current_account ||= AccountRepository.find_by(subdomain: subdomain)
  end
end
