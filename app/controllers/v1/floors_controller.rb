class V1::FloorsController < V1::AuthController
  before_action :authenticate_v1_user!

  def index
    @floors = Floor.all
  end

  def create
    @floor = Floors::CreateFloorForm.new(floor_params).submit
    render :show
  end

  def show
    @floor = Floor.find(params[:id])
  end

  def update
    @floor = Floors::UpdateFloorForm.new(floor_params).submit
    render :show
  end

  def destroy
    floor = Floor.find(params[:id])
    floor.destroy!
    render json: { data: {}, success: true, message: :success, errors: nil, code: 200 }
  end

  private

  def floor_params
    params.require(:floor)
          .permit(:id, :name, table_attributes: [:id, :name, :customer_capacity, :properties, :state, :floor_id, :_destroy])
  end
end
