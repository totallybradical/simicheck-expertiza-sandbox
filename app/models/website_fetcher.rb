
class WebsiteFetcher
  require 'net/http'
  # TODO: mixin the HTTP calls
  
  class << self
    def SupportsUrl?(url)
      true
    end
  end

  def initialize(params)
    @url = params["url"]
  end

  def FetchContent
    # http://stackoverflow.com/questions/4581075/how-make-a-http-request-using-ruby-on-rails
    puts "Fetching from website URL: " + @url
    url = URI.parse(@url)

    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') {|http|
      http.request(req)
    }

    if res.code != "200"
      puts "Failed request to website content URL: #{@url}, code #{res.code}"
      ""
    else
      sanitize(res.body)
    end
  end

  private
  def sanitize(html_string)
    # https://apidock.com/rails/ActionView/Helpers/SanitizeHelper/strip_tags
    ActionController::Base.helpers.strip_tags(html_string)
  end

end

