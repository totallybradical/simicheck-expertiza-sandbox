class WebsiteController < ApplicationController
  def index
    website = "http://www.lipsum.com"
    doc1 = "https://drive.google.com/open?id=16OB3_BNItpKLbFU5dRsLx9NUJgStOs5Fl3GNQVjqLV4"
    doc2 = "https://docs.google.com/document/d/16OB3_BNItpKLbFU5dRsLx9NUJgStOs5Fl3GNQVjqLV4/edit"
    pullReq = "https://patch-diff.githubusercontent.com/raw/totallybradical/expertiza-simicheck-integration/pull/1"

    url = pullReq

    fetcher = SubmissionContentFetcher.Factory(url)
    if fetcher
      @text = fetcher.FetchContent()
    else
      @text = "Error occurred for URL: " + url
    end
  end
end
