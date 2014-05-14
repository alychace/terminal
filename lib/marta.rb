require 'net/http'
require 'json'

KEY = "225748ce-ec39-4346-b6e0-7d2135dd1bec"
URL = "http://developer.itsmarta.com/RealtimeTrain/RestServiceNextTrain/GetRealtimeArrivals?apikey=#{KEY}"

module Marta
  def get_data
    response = Net::HTTP.get_response(URI.parse(URL))
    text = response.body
    return JSON.load(text)
  end

  def get_stations
    # Gets a list of stations.
    stations = []
    for train in @trains
      station = train['STATION'].split.map(&:capitalize).join(' ')
      stations.push(station) unless stations.include?(station)
    end
    return stations.sort
  end

  def get_trains
    # Get a list of all trains coming into all stations.
    stations = []
    trains = get_data
    for train in trains
      for station in get_stations
        if station == train['STATION'].split.map(&:capitalize).join(' ')
          stations.push(station.to_s)
        end
      end
    end
    return stations.uniq.sort
  end
end