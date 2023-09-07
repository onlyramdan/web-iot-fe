class ReportController < ApplicationController
    before_action :cek_login
    def index
        url = '/monitoring/all'
        @cek_data = ReportHelper.req_get(url)
        if @cek_data['content'].present?
            @data = @cek_data['content']
            @meta = @cek_data['meta']
        end
    end
end
