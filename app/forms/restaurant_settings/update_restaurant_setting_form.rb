module RestaurantSettings
  class UpdateRestaurantSettingForm < BaseRestaurantSettingForm
    def submit
      validate!
      RestaurantSetting.find(id).tap { |restaurant_setting| restaurant_setting.update!(attributes) }
    end
  end
end
