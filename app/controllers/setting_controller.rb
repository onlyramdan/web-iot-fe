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
        url_user = "users/all"
        @get_user = SettingHelper.req_get(url_user)
        if @get_user['content'].present?
            @data_user = @get_user['content']
            @meta_user = @get_user['meta']
        end
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

    def simpan_user
        Rails.logger.info"==========>#{params}"
        if params["id_user"].present?
            if params['role']=="user"
                role = "64e85e65abf2c224600f736d"
            else
                role = "64e85e87abf2c224600f736e"
            end
            data  = {
                id: params['id_user'],
                nama: params['nama'],
                email: params['email'],
                user_role_id: role,
                status: params['status_user'],
            }
            url_update_user = "/updateuser"
            @update_alat = SettingHelper.req_post(url_update_user, data)
            if @update_alat['status']==true
                redirect_to "/setting"
            else
                redirect_to "/setting"
            end
        else
            if params['role']=="user"
                role = "64e85e65abf2c224600f736d"
            else
                role = "64e85e87abf2c224600f736e"
            end
            data  = {
                nama: params['nama'],
                email: params['email'],
                user_role_id: role,
                password: "password",
                status: params['status_user'],
            }
            url_tambah_user = "/tambahuser"
            @tambah_user = SettingHelper.req_post(url_tambah_user,data)
            if @tambah_user['status']==true
                redirect_to '/setting'
            else
                redirect_to '/setting'
            end
        end
    end

    def hapus_alat
        # render json: params["id"]
        if params['id'].present?
            url = "hapusalat/"+params['id']
            Rails.logger.info"=======>#{url}"
            @hapus_alat = SettingHelper.req_post_hapus(url)
            render json: @hapus_alat
        end
    end
    def hapus_user
        if params['id'].present?
            url = "hapususer/"+params['id']
            Rails.logger.info"=======>#{url}"
            @hapus_user = SettingHelper.req_post_hapus(url)
            render json: @hapus_user
        end
    end
end
