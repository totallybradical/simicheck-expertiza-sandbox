
class SubmissionContentFetcher
  class << self
    def Factory(url)
      # TODO: Go thru CSV file and match, fill in the param hash
      params = { "url" => url } 

      if GoogleDocFetcher.SupportsUrl?(url)
        GoogleDocFetcher.new(params)

      elsif GithubArchiveFetcher.SupportsUrl?(url)
        GithubArchiveFetcher.new(params)

      elsif GithubPullRequestFetcher.SupportsUrl?(url)
        GithubPullRequestFetcher.new(params)

      elsif WebsiteFetcher.SupportsUrl?(url) # leave last as catch-all
        WebsiteFetcher.new(params)

      else
        nil
      end
    end

    # Don't allow this object to be instantiated
    private :new
  end
end

