class V1::CustomersController < V1::AuthController
  include Pagy::Backend

  before_action :authenticate_v1_user!

  def index
    pagy, @customers = pagy(Customer.all)
    @paging = pagy_metadata(pagy)
  end

  def create
    @customer = Customers::RegistrationCustomerForm.new(customer_params).submit
    render :show
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customers::UpdateCustomerForm.new(update_customer_params).submit
    render :show
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.discard
    render json: { data: {}, success: true, message: :success, errors: nil, code: 200 }
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone, :number_of_visits, :last_visited_date, :customer_type,
                                     :name_kana, :postcode, :prefecture, :municipality, :address, :building_address,
                                     :date_of_birth, :gender, :email, :remarks, :company_name)
  end

  def update_customer_params
    customer = Customer.find(params[:id])
    customer.assign_attributes(customer_params)
    customer.attributes.slice(*Customers::UpdateCustomerForm.attribute_names)
  end
end
