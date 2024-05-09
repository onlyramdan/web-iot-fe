require 'csv'
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
    def download_csv
    if params['tgl_mulai'].present? && params['tgl_akhir'].present?
        data = {
          tgl_mulai: params['tgl_mulai'],
          tgl_akhir: params['tgl_akhir']
        }
        url = "data/monitoring"
        @get_data_csv = ReportHelper.req_post(url, data)
        @data_csv = @get_data_csv['content']
        
        filename = "report.csv"
        # Tell Rack to stream the content
        headers.delete("Content-Length")
        
        # Don't cache anything from this generated endpoint
        headers["Cache-Control"] = "no-cache"

        # Tell the browser this is a CSV file
        headers["Content-Type"] = "text/csv"

        # Make the file download with a specific filename
        headers["Content-Disposition"] = "attachment; filename=\"#{filename}\""

        # Don't buffer when going through proxy servers
        headers["X-Accel-Buffering"] = "no"

        # Set an Enumerator as the body
        self.response_body = parse_report(@data_csv)
        # Set the status to success
        response.status = 200
      end
    end
    def parse_report(data_csv)
        Enumerator.new do |row|
            row << CSV.generate_line(['no','tanggal','jam','suhu','kelembaban', 'air Quality', 'alat'],col_sep: ";")
            if data_csv.present?
                no = 1
                data_csv.each do |data|
                    row << CSV.generate_line([
                    no,
                    data['tanggal'],
                    data['jam'],
                    data['suhu'],
                    data['kelembaban'],
                    data['airQuality'],
                    data['alat'],
                    ], col_sep: ";" ) 
                    no += 1
                end
            end
        end
    end
end
  