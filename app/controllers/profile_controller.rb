class ProfileController < ApplicationController
    before_action :cek_login
    def index
        url = "/user/"+session['sess']['id']
        @profile = ProfileHelper.req_get(url)
    end
    def edit
        data = {
            id: params['id'],
            nama: params['nama'],
            email: params['email'],
            password: params['password']
        }
        url = "/updateuser"
        @edit = ProfileHelper.req_post(url,data)
        render json: @edit
    end
end
