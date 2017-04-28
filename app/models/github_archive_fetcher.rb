
class GithubArchiveFetcher
  require 'http_request'
  
  class << self
    def SupportsUrl?(url)
      lowerCaseUrl = url.downcase
      ((lowerCaseUrl.include? "github") and
       (lowerCaseUrl.include? "/archive/") and
       (lowerCaseUrl[-4..-1] == ".zip"))
    end
  end

  def initialize(params)
    @url = params["url"]
    @filename = params["zipfilename"]
  end

  def FetchContent
    puts "Downloading GitHub archive at " + @url
    tempFile = HttpRequest.GetFile(@url, @filename)
    if tempFile
      # TODO: should we pass on a file handle and the caller has to know? For now just delete the file
      tempFile.close
      tempFile.unlink # deletes the temp file
    else
      puts "Failed to download GitHub archive at " + @url
    end
    ""
  end

end

