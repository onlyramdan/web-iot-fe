class ReportController < ApplicationController
    before_action :cek_login
    def index
        url = '/monitoring/all'
        page = params[:page].present? ? params[:page] : 1
        limit = params[:limit].present? ? params[:limit] : 10

        # Menggabungkan parameter page dan limit ke dalam URL permintaan
        url += "?page=#{page}&limit=#{limit}"
        @cek_data = ReportHelper.req_get(url)
        if @cek_data['content'].present?
            @data = @cek_data['content']
            @meta = @cek_data['meta']
        end
    end
    def report
        if params['tgl_mulai'].present? && params['tgl_akhir'].present?
            data = {
                tgl_mulai: params['tgl_mulai'],
                tgl_akhir: params['tgl_akhir']
            }
            url = "data/monitoring"
            @get_data_excel = ReportHelper.req_post(url, data)
            @data_xlsx = @get_data_excel['content']
            respond_to do |format|
                format.xlsx{render xlsx: 'report',filename: "monitoring.xlsx"}
            end
        end
    end
end
