require 'httparty'
module SignupHelper
    def self.req_post(url_path,data)
        url = ENV['API_IoT']+url_path
        res = HTTParty.post(url,
            :body => data,
            verify: false
        )
        return res.parsed_response
    end
end

