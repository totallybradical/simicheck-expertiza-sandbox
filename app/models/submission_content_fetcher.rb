
class SubmissionContentFetcher
  
  # TODO: start a separate ruby application to develop this interface so it's faster,
  #       and then bring in here once all of the tests are written

  class << self
    def Factory(url)
      # Go thru CSV file and match, fill in the param hash
      params = { "url" => url } 

      return WebsiteFetcher.new(params)
    end

    # Don't allow this object to be instantiated
    private :new
  end

end
