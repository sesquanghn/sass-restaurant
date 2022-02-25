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
    attribute :name_kana, :string
    attribute :postcode, :string
    attribute :prefecture, :string
    attribute :municipality, :string
    attribute :address, :string
    attribute :building_address, :string
    attribute :date_of_birth, :date
    attribute :gender, :string
    attribute :email, :string
    attribute :remarks, :string
    attribute :company_name, :string

    validates :name, :phone, :name_kana, presence: true
    validates :email, format: { with: EMAIL_REGEX }
    validates :phone, :postcode, format: { with: NUMBER_OPTION_REGEX }
    validate :name_kana_character

    private

    def name_kana_character
      errors.add(:name_kana, :invalid) if name_kana.present? && !Moji.type?(name_kana, Moji::KATA)
    end
  end
end
