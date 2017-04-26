
class GithubFetcher
  require 'net/http'
  
  def initialize(params)
    @url = params["url"]
  end

  def SupportsUrl?(url)
    false
  end

  def FetchContent
    ""
  end

end

