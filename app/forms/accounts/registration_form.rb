module Accounts
  class RegistrationForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attribute :company_name, :string
    attribute :owner_name, :string
    attribute :owner_email, :string
    attribute :owner_password, :string
    attribute :owner_password_confirmation, :string

    validates :company_name, presence: true
    validates :owner_name, presence: true
    validates :owner_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :owner_password, presence: true
    validates :owner_password_confirmation, presence: true

    validate :subdomain_uniqness
    validate :password_consistent

    def submit
      return unless validate!

      account = create_account
      Apartment::Tenant.create(subdomain)
      Apartment::Tenant.switch!(subdomain)
      owner = create_owner
      attach_owner_to_account(owner, account)
      account
    end

    def persisted?
      false
    end

    def save!
      false
    end

    private

    def subdomain_uniqness
      subdomain_account = ::Account.find_by(subdomain: subdomain)
      errors.add(:company_name, :taken) if subdomain_account.present?
    end

    def password_consistent
      errors.add(:owner_password, :confirmation) if owner_password != owner_password_confirmation
    end

    def create_account
      ::Account.create!(account_params)
    end

    def create_owner
      owner = ::User.create!(owner_params)
      owner
    end

    def attach_owner_to_account(owner, account)
      account.update!(owner: owner)
    end

    def subdomain
      @subdomain ||= company_name
    end

    def account_params
      {
        subdomain: subdomain,
        company_name: company_name.force_encoding('UTF-8')
      }
    end

    def owner_params
      {
        name: owner_name,
        email: owner_email,
        password: owner_password,
        password_confirmation: owner_password_confirmation
      }
    end
  end
end
