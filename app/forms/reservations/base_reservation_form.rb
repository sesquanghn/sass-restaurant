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
    validate :reserve_time_correct

    private

    def reserve_time_correct
      return if start_time < end_time && !reserve_time_overlap?

      errors.add(:base, 'Reservation time is invalid')
    end

    def reserve_time_overlap?
      Reservation.exists?(['(start_time, end_time) OVERLAPS (?, ?) AND table_id = ?', start_time, end_time, table_id])
    end
  end
end
