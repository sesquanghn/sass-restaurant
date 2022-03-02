class BaseQueries
  attr_reader :result

  def initialize(records)
    @result = records
  end

  def by_id(id)
    @result = @result.where(id: id) if id.present?
    self
  end
end
