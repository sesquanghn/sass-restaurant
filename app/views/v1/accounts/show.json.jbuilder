json.id @account.id
json.type 'account'
json.attributes @account.attributes

json.relationships do
  json.restaurant_setting do
    json.partial! 'v1/restaurant_settings/restaurant_setting', restaurant_setting: @account.restaurant_setting
  end
end
