module Floors
  class BaseFloorForm < BaseForm
    include ActiveModel::Model
    include ActiveModel::Attributes

    attr_accessor :table_attributes

    attribute :id, :integer
    attribute :name, :string

    validates :name, presence: true

    def initialize(params = {})
      super(params)
      @table_attributes ||= []
    end
  end
end
