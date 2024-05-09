require 'httparty'
module DashbordHelper
    def self.req_get(url_path)
        url = ENV['API_IoT']+url_path
        res = HTTParty.get(url)
        return res.parsed_response
    end  
    def self.req_get_topic(url, data)
        url = ENV['API_IoT']+url
        res = HTTParty.get(url,
            :body => data,
            verify: false)   
    end 
    def self.req_get_body(url, data)
        url = ENV['API_IoT']+url
        res = HTTParty.get(url,
            :body => data,
            verify: false)   
    end 
end
