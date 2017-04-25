
class WebsiteFetcher
  require 'net/http'
  
  def initialize(params)
    @url = params["url"]
  end

  def FetchContent
    # http://stackoverflow.com/questions/4581075/how-make-a-http-request-using-ruby-on-rails
    puts "Fetching from website URL: " + @url
    url = URI.parse(@url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    sanitize(res.body)
  end

  private
  def sanitize(html_string)
    ActionController::Base.helpers.strip_tags(html_string)
  end

end

