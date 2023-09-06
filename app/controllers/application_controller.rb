class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session,
    if: Proc.new { |c| c.request.format =~ %r{application/json} }

    def cek_login
        if !session['sess'].present?
            redirect_to '/login'
        end
    end
end
