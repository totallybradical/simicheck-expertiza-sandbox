
class GoogleDocFetcher
  require 'net/http'

  def initialize(params)
    @url = params["url"]
    puts "Created GoogleDoc, " + @url
  end

  def SupportsUrl?(url)
    false
  end

  def FetchContent
    fileId = getIdFromUrl(@url)
    if fileId.length >= 0
      # TODO: requires link sharing is enabled, maybe write a validate function
      rawUrl = "https://www.googleapis.com/drive/v3/files/" + fileId + "/export?" 
                + "mimeType=text/plain"
                + "key="

      url = URI.parse(rawUrl)
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }

      # TODO: check request return code
      res.body
    else
      puts "Couldn't parse Google Docs URL: " + @url
      ""
    end


file_id = '1ZdR3L3qP4Bkq8noWLJHSr_iBau0DNT4Kli4SxNc2YEo'
content = drive_service.export_file(file_id,
                                    'application/pdf',
                                    download_dest: StringIO.new)
https://drive.google.com/open?id=1qnFWXyLR8WmfrK6RvmXgR-IztReRCP7cq7N2GazqLAs

  end

  private
  def getIdFromUrl(url)
    idRegex = /id=([a-zA-Z0-9\-\_\+\.\~]+)[\/&]?/
    if idRegex
      puts "Found ID as " + idRegex.captures[0] + " in: " + url
      idRegex.captures[0]
    else
      puts "ID not found in: " + url
      ""
    end
  end

end
