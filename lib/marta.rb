# Copyright Alexandra Chace 2014-2016

# This file is part of Terminal.

# Terminal is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Terminal is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Terminal.  If not, see <http://www.gnu.org/licenses/>.

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