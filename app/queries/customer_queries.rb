class CustomerQueries < BaseQueries
  def by_name_start_with(name)
    @result = @result.where("customers.name LIKE ?", "#{name}%") if name.present?
    self
  end

  def by_phone(phone)
    @result = @result.where(phone: phone) if phone.present?
    self
  end

  def by_customer_type(customer_type)
    @result = @result.where(customer_type: customer_type) if customer_type.present?
    self
  end
end
