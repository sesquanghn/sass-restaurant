class ReservationQueries < BaseQueries
  def by_reserved_at(date = nil)
    date ||= Date.current
    @result = @result.where("reservations.start_time::date = :q AND reservations.end_time::date = :q", q: date)
    self
  end
end
