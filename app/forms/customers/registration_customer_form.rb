module Customers
  class RegistrationCustomerForm < BaseCustomerForm
    def submit
      validate!
      Customer.create!(attributes)
    end
  end
end
