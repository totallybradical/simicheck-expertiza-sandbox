
class WebsiteFetcher
  require 'net/http'
  #require 'html/sanitizer'

  def initialize(params)
    @url = params["url"]
  end

  def FetchContent
    puts "Fetching from website URL: " + @url
    url = URI.parse(@url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    res.body
  end

  # private
  #   def sanitize(html_string)
  #     sanitizer = Rails::HTML::FullSanitizer.new
  #     sanitizer.sanitize(html_string)
  #   end

end

