class V1::ReservationsController < V1::AuthController
  before_action :authenticate_v1_user!

  def index
    @reservations = ReservationQueries.new(Reservation.includes(:customer, :table))
                                      .by_reserved_at(params[:reserved_at])
                                      .result
  end

  def create
    @reservation = Reservations::CreateReservationForm.new(reservation_params).submit
    render :show
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservations::UpdateReservationForm.new(update_reservation_params).submit
    render :show
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.discard
    render json: { data: {}, success: true, message: :success, errors: nil, code: 200 }
  end

  private

  def reservation_params
    params.require(:reservation)
          .permit(:start_time, :end_time, :voucher_code, :number_of_guests, :reservation_state, :user_id, :customer_id, :table_id)
  end

  def update_reservation_params
    reservation = Reservation.find(params[:id])
    reservation.assign_attributes(reservation_params)
    reservation.attributes.slice(*Reservations::UpdateReservationForm.attribute_names)
  end
end
