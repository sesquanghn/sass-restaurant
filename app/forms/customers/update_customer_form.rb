module Customers
  class UpdateCustomerForm < BaseCustomerForm
    def submit
      validate!
      Customer.find(id).tap { |customer| customer.update!(attributes) }
    end
  end
end
