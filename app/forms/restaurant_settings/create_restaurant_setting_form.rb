module RestaurantSettings
  class CreateRestaurantSettingForm < BaseRestaurantSettingForm
    def submit
      validate!
      RestaurantSetting.create!(attributes)
    end
  end
end
