class WebsiteController < ApplicationController
  def index
    fetcher = SubmissionContentFetcher.Factory("http://www.lipsum.com")
    # if fetcher
    @text = fetcher.FetchContent()
  end
end
