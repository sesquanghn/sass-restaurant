module Customers
  class BaseCustomerForm < BaseForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :id, :integer
    attribute :name, :string
    attribute :phone, :string
    attribute :number_of_visits, :integer
    attribute :last_visited_date, :datetime
    attribute :customer_type, :string

    validates :name, :phone, :number_of_visits, :last_visited_date, :customer_type, presence: true
  end
end
