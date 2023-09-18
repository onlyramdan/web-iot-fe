class DashbordController < ApplicationController
    before_action :cek_login
    def index
    end
    def get_data_mqtt
        url = "/baca"
        @data_mqtt = DashbordHelper.req_get(url)
        if @data_mqtt.present?
            render json: @data_mqtt
        end
    end
end