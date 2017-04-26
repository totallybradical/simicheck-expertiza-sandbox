
class GoogleDocFetcher
  require 'net/http'
  # TODO: mixin the HTTP calls

  class << self
    def SupportsUrl?(url)
      lowerCaseUrl = url.downcase
      return ((lowerCaseUrl.include? "drive.google.com") or 
              (lowerCaseUrl.include? "docs.google.com"))
    end
  end

  def initialize(params)
    @url = params["url"]
    puts "Created GoogleDoc, " + @url
  end

  def FetchContent
    fileId = getIdFromUrl(@url)
    if fileId.length >= 0
      # TODO: requires link sharing is enabled, maybe write a validate function
      reqUrl = "https://www.googleapis.com/drive/v3/files/#{fileId}" + "/export?" + "mimeType=text/plain" + "&key="
      puts reqUrl

      url = URI.parse(reqUrl)
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
  end

  private
  def getIdFromUrl(url)
    idRegex = /[a-zA-Z0-9\-\_\+\.\~]+/
    idQueryRegex = /id=(#{idRegex})[\/&]?/
    idPathRegex = /\/d\/(#{idRegex})\//

    idQueryRegex.match(url) {|m|
      puts "Found ID as " + m.captures[0] + " in query: " + url
      return m.captures[0]
    }

    idPathRegex.match(url) {|m|
      puts "Found ID as " + m.captures[0] + " in path: " + url
      return m.captures[0]
    }

    puts "ID not found in: " + url
    return ""
  end

end
