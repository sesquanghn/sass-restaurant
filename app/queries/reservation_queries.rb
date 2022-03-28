class ReservationQueries < BaseQueries
  def by_reserved_at(date = nil)
    date ||= Date.current
    @result = @result.where("reservations.start_time::date = ? AND reservations.end_time::date = ?", date, date)
    self
  end
end
