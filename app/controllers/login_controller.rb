class LoginController < ApplicationController
    def index
    end
    def login
        data = {
            email: params['email'],
            password: params['password']
        }
        url = "/login"
        @ceklogin = LoginHelper.req_post(url,data)
        if @ceklogin['status']
            my_sess = {
                id: @ceklogin['content']['id'],
                nama: @ceklogin['content']['nama'],
                email: @ceklogin['content']['email'],
                password: @ceklogin['content']['password'],
                role: @ceklogin['content']['user_role']
            }
            session['sess'] = my_sess
            redirect_to "/dashboard"
        else
            render json: @ceklogin
        end
    end
    def logout
        reset_session
        redirect_to "/login"
    end
end