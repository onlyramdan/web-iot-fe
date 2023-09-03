class SignupController < ApplicationController
    def index
    end
    def signup
        data = {
            email: params["email"],
            nama: params["nama"],
            password: params["password"],
            status: "1",
            user_role_id: "64e85e65abf2c224600f736d"
        }
        url= "/tambahuser"
        @signup = SignupHelper.req_post(url,data)
        if @signup['status']
            redirect_to "/login"
        else
            redirect_to "/signup"
        end
    end
end
