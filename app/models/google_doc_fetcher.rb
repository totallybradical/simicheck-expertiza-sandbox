
class GoogleDocFetcher

  def initialize(params)
    @url = params["url"]
    puts "Created GoogleDoc, " + @url
  end

  def FetchContent
    return "GoogleDoc fetching content"
  end

end

