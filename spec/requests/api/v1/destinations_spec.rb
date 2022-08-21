require 'rails_helper'

RSpec.describe "Api::V1::Destinations", type: :request do
  describe 'checkout connection to Reservamos API' do
    it 'Return correctly Status and data' do |_variable|
      city = 'mon'
      url = "https://search.reservamos.mx/api/v2/places?q=#{city}&from=ciudad-de-mexico"
      response = RestClient.get(url)
      result = JSON.parse(response.to_s)

      expect(result).to include(a_hash_including('city_name'))
      expect(result).to include(a_hash_including('lat'))
      expect(result).to include(a_hash_including('long'))
    end
  end

  describe 'checkout connection to Open Weather API' do
    it 'Return correctly Status and data' do |_variable|
      api_token = 'a5a47c18197737e8eeca634cd6acb581'
      part = 'current,minutely,hourly,alerts'
      lat = '25.6866142'
      long = '-100.3161126'
      url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&exclude=#{part}&units=metric&appid=#{api_token}"
      response = RestClient.get(url)
      result = JSON.parse(response.to_s)

      expect(result).to include(a_hash_including('timezone'))
      expect(result).to include(a_hash_including('lat'))
      expect(result).to include(a_hash_including('lon'))
    end
  end
end
