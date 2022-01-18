class Errors::ValidationErrorsSerializer
  attr_reader :record

  def initialize(record)
    @record = record
  end

  def serialize
    all_messages = record.errors.to_hash(true)
    record.errors.details.map do |field, details|
      messages = all_messages[field]
      details.map.with_index do |error_details, index|
        Errors::ValidationErrorSerializer.new(
          record, field, error_details, messages[index]
        ).serialize
      end
    end.flatten
  end
end
