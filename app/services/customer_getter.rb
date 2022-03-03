class CustomerGetter
  class << self
    def execute(params)
      CustomerQueries.new(Customer.all)
                     .by_phone(params[:phone])
                     .by_id(params[:customer_number])
                     .by_name_start_with(params[:name])
                     .by_customer_type(params[:customer_type])
                     .result
    end
  end
end
