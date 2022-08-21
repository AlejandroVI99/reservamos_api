json.data @destinations do |city|
  json.city_id city["id"]
  json.city_name city['city_name']
  json.country city['country']
  json.todays_min_temperature city['daily'][0]['temp']['min']
  json.todays_max_temperature city['daily'][0]['temp']['max']
  json.lat city['lat']
  json.long city['long']
  json.result_type city['result_type']
  json.next_7_days_temperature do |json|
    json.array! city['daily'] do |daily|
      next if daily == city['daily'][0]
      json.date Time.at(daily['dt']).to_datetime
      json.temperature_min daily['temp']['min']
      json.temperature_max daily['temp']['max']
    end
  end
end