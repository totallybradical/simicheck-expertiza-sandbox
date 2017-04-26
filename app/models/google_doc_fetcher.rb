
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
  end

  def FetchContent
    fileId = getIdFromUrl(@url)
    if fileId.length >= 0
      # TODO: requires that permissions on the doc are public, or anyone with the link can view, maybe write a validate function
      reqUrl = "https://www.googleapis.com/drive/v3/files/#{fileId}" + "/export?" + "mimeType=text/plain" + "&key="

      url = URI.parse(reqUrl)
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') {|http|
        http.request(req)
      }

      if res.code != "200"
        puts "Failed request to URL: #{@url}, response: " + res.body
        ""
      else
        res.body
      end

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
