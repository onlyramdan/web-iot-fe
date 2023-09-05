class ProfileController < ApplicationController
    def index
        url = "/user/"+session['sess']['id']
        @profile = ProfileHelper.req_get(url)
    end
    def edit
        render json: params
    end
end
