class CustomerSearch
  class << self
    def execute(params)
      customers = Customer.all
      customers = customers.by_phone(params[:phone]) if params[:phone]
      customers = customers.by_name_start_with(params[:name]) if params[:name]
      customers = customers.by_id(params[:customer_number]) if params[:customer_number]
      customers = customers.by_customer_type(params[:customer_type]) if params[:customer_type]

      customers
    end
  end
end
