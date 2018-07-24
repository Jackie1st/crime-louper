require 'soda/client'

class ShowCrime
  attr_reader :location
  attr_accessor :results

  def initialize(location)
    @location = location
    @results = []
  end

  def query
    client = SODA::Client.new({:domain => "data.lacity.org", :app_token => "YgKOkZQhjnWR2hTq2x67M2UPi"})
    @results = client.get("/resource/7fvc-faax.json", :$limit => 10)
    parse_results(results)
  end

  def parse_results(results)
    results.map do |incident|
      Result.create(area: incident["area_name"],
                    location: incident["location"],
                    crime: incident["crm_cd_desc"],
                    description: incident["premise_desc"],
                    weapon: incident["weapon_desc"],
                    time: incident["time_occ"])
    end
  end


  end


