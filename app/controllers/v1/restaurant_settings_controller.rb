class V1::RestaurantSettingsController < V1::AuthController
  before_action :authenticate_v1_user!

  def create
    @restaurant_setting = RestaurantSettings::CreateRestaurantSettingForm.new(restaurant_setting_params).submit
    render :show
  end

  def show
    @restaurant_setting = RestaurantSetting.find(params[:id])
  end

  def update
    @restaurant_setting = RestaurantSettings::UpdateRestaurantSettingForm.new(restaurant_setting_params).submit
    render :show
  end

  private

  def restaurant_setting_params
    params.require(:restaurant_setting).permit(:open_hours, :close_hours)
                                       .merge(id: params[:id], account_id: params[:account_id])
  end
end
