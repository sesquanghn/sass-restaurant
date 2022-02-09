module Discardable
  extend ActiveSupport::Concern

  included do
    include Discard::Model
    default_scope -> { kept }

    before_discard do
      raise ActiveRecord::InvalidForeignKey unless reload.discardable?
    end
  end

  def discardable?
    self.class.reflect_on_all_associations.all? do |assoc|
      assoc.name == :versions || [ (assoc.macro == :has_one && send(assoc.name).nil?),
                                   (assoc.macro == :has_many && send(assoc.name).empty? ),
                                   (assoc.macro == :has_and_belongs_to_many && send(assoc.name).empty?),
                                   assoc.macro == :belongs_to
                                  ].any?
    end
  end
end
