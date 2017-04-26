class WebsiteController < ApplicationController
  def index
# http://www.lipsum.com

#https://drive.google.com/open?id=16OB3_BNItpKLbFU5dRsLx9NUJgStOs5Fl3GNQVjqLV4
#https://docs.google.com/document/d/16OB3_BNItpKLbFU5dRsLx9NUJgStOs5Fl3GNQVjqLV4/edit

    fetcher = SubmissionContentFetcher.Factory("https://docs.google.com/document/d/16OB3_BNItpKLbFU5dRsLx9NUJgStOs5Fl3GNQVjqLV4/edit")
    # if fetcher
    @text = fetcher.FetchContent()
  end
end
