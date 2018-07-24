require 'httparty'
require 'json'

class ShowInfo
  include HTTParty

  def query(weapon)
    if weapon
      if weapon == "STRONG-ARM (HANDS, FIST, FEET OR BODILY FORCE)"
        weapon = "hand-to-hand combat"
        response = HTTParty.get("https://en.wikipedia.org/w/api.php?action=query&format=json&list=search&srsearch=#{weapon}")
        response.parsed_response['query']['search'][0]['snippet'].html_safe
     end
    end

  end

end
