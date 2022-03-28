module Reservations
  class BaseReservationForm < BaseForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :id, :integer
    attribute :start_time, :datetime
    attribute :end_time, :datetime
    attribute :voucher_code, :string
    attribute :number_of_guests, :integer
    attribute :reservation_state, :integer
    attribute :user_id, :integer
    attribute :customer_id, :integer
    attribute :table_id, :integer

    validates :start_time, :end_time, :customer_id, :table_id, presence: true
  end
end
