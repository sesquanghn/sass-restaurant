module RestaurantSettings
  class BaseRestaurantSettingForm < BaseForm
    TIME_REGEX = /\A([01]?[0-9]|2[0-3])\:[0-5][0-9]\z/

    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :id, :integer
    attribute :open_hours, :string
    attribute :close_hours, :string
    attribute :account_id, :integer

    validates :account_id, presence: true
    validates :open_hours, :close_hours, format: { with: TIME_REGEX }
    validate :opening_hours_correct, if: -> { open_hours.present? && close_hours.present? }

    private

    def opening_hours_correct
      return if Time.parse(open_hours) < Time.parse(close_hours)

      errors.add(:base, 'Opening hours is invalid')
    end
  end
end
