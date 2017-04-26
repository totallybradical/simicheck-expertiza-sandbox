
class GithubFetcher
  require 'net/http'
  
  class << self
    def SupportsUrl?(url)
      false
    end
  end

  def initialize(params)
    @url = params["url"]
  end

  def FetchContent
    ""
  end

end

