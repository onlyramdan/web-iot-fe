class DashbordController < ApplicationController
    before_action :cek_login
    def index
        url = "aktifalat"
        @alataktif = DashbordHelper.req_get(url)
        @data_alat = @alataktif["content"]
    end
    def get_data_mqtt
        url = "baca"
        @alat = params["topic"]
        data = {
           topic: params["topic"]
        }
        @data_mqtt = DashbordHelper.req_get_topic(url,data)
        if @data_mqtt.present?
            render json: @data_mqtt
        end
    end
    def data_alat
        url = "find_alat"
        
        data = {
            id: params["id"]
        }

        @data_alat = DashbordHelper.req_get_body(url,data)
        if @data_alat.present?
            data = @data_alat
        end
        render json: data
    end
    def monitor_lokasi
        url = "monitorings/monitoring_perlokasi"
        @data_monitoring_perlokasi = DashbordHelper.req_get(url)
    end
end
