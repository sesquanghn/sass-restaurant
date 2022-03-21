module Tables
  class BaseTableForm < BaseForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attr_accessor :_destroy

    attribute :id, :integer
    attribute :name, :string
    attribute :customer_capacity, :integer
    attribute :properties, :string
    attribute :state, :integer
    attribute :floor_id, :integer

    validates :name, :floor_id, presence: true
  end
end
