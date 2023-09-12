require 'httparty'
module SettingHelper
    def self.req_get(url_path)
        url = ENV['API_IoT']+url_path
        res = HTTParty.get(url)
        return res.parsed_response
    end
    def self.req_post(url_path,data)
        url = ENV['API_IoT']+url_path
        res = HTTParty.post(url,
            :body => data,
            verify: false
        )
        return res.parsed_response
    end
    def self.req_post_hapus(url_path)
        Rails.logger.info"====== helper=========>#{url_path}"
        url = ENV['API_IoT']+url_path
        Rails.logger.info"====== helper=========>#{url}"
        res = HTTParty.post(url)
        return res.parsed_response
    end
end
