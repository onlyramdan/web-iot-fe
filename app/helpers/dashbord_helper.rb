require 'httparty'
module DashbordHelper
    def self.req_get(url_path)
        url = ENV['API_IoT']+url_path
        res = HTTParty.get(url)
        return res.parsed_response
    end  
end
