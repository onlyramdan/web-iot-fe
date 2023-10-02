class DashbordController < ApplicationController
    before_action :cek_login
    def index
        url = "aktifalat"
        @alataktif = DashbordHelper.req_get(url)
        @data_alat = @alataktif["content"]
    end
    def get_data_mqtt
        url = "baca"
        data = {
           topic: params["topic"]
        }
        Rails.logger.info "================>#{data}"
        @data_mqtt = DashbordHelper.req_get_topic(url,data)
        if @data_mqtt.present?
            render json: @data_mqtt
        end
    end
    def control
    end
end
