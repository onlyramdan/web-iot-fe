class SettingController < ApplicationController
    before_action :cek_login
    def index
        # untuk get alat
        url_alat= "/alats/all"
        @get_alat = SettingHelper.req_get(url_alat)
        if @get_alat['content'].present?
            @data_alat = @get_alat['content']
            @meta = @get_alat['meta']
        end

        # untuk get user
        # url_user = ""
        # @get_user = SettingHelper.req_get(url_user)
    end
    def simpan
        if params["id_alat"].present?
            data  = {
                id: params['id_alat'],
                nama_alat: params['nama_alat'],
                lokasi: params['lokasi'],
                status: params['status'],
            }
            url_update_alat = "/updatealat"
            @update_alat = SettingHelper.req_post(url_update_alat, data)
            if @update_alat['status']==true
                redirect_to "/setting"
            else
                redirect_to "/setting"
            end
        else
            data  = {
                nama_alat: params['nama_alat'],
                lokasi: params['lokasi'],
                status: params['status'],
            }
            url_tambah_alat = "/tambahalat"
            @tambah_alat = SettingHelper.req_post(url_tambah_alat,data)
            if @tambah_alat['status']==true
                redirect_to '/setting'
            else
                redirect_to '/setting'
            end
        end
    end

    def hapus_alat
        if params['id'].present?
        url = "/hapusalat/" + params['id']
        render json: url
        return
        end
    end
end
