class V1::AccountsController < V1::ApiController
  def create
    account = Accounts::RegistrationForm.new(account_params).submit

    Apartment::Tenant.switch!(account.subdomain)
    tenant_to_header(account)

    render_account_create_success(account)
  end

  def show
    @account = Account.find(params[:id])
  end

  private

  def account_params
    registration_account_params = params.require(:account)
                                        .permit(:company_name, :owner_name, :owner_email,
                                                :owner_password, :owner_password_confirmation)
    registration_account_params
  end


  def render_account_create_success(account)
    render json: {
      data: account.as_json,
      success: true,
      message: 'Account created successfully',
      errors: '',
      code: 201
    }, status: 201
  end
end
