# frozen_string_literal: true

class Api::V1::DestinationsController < ApplicationController
  API_TOKEN = 'a5a47c18197737e8eeca634cd6acb581'
  def index
    @destinations = get_destination(params[:city])
  end

  private

  def get_destination(city)
    url = "https://search.reservamos.mx/api/v2/places?q=#{city}&from=ciudad-de-mexico"
    response = RestClient.get(url)
    result = JSON.parse(response.to_s)
    result = result.select { |x| x['result_type'] == 'city' }
    open_weather(result)
  end

  def open_weather(cities)
    part = 'current,minutely,hourly,alerts'

    cities.each do |city|
      lat = city['lat']
      long = city['long']
      url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&exclude=#{part}&units=metric&appid=#{API_TOKEN}"
      response = RestClient.get(url)
      result = JSON.parse(response.to_s)
      city.merge!('min_temp' => result['daily'][0]['temp']['min'])
      city.merge!('max_temp' => result['daily'][0]['temp']['max'])
      city.merge!('daily' => result['daily'])
    end
    cities = cities.sort_by{|x| x['min_temp']}
  end
end
