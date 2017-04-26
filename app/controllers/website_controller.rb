class WebsiteController < ApplicationController
  def index
# http://www.lipsum.com
# https://drive.google.com/open?id=1qnFWXyLR8WmfrK6RvmXgR-IztReRCP7cq7N2GazqLAs
# https://docs.google.com/document/d/1qnFWXyLR8WmfrK6RvmXgR-IztReRCP7cq7N2GazqLAs/edit

    fetcher = SubmissionContentFetcher.Factory("https://docs.google.com/document/d/1qnFWXyLR8WmfrK6RvmXgR-IztReRCP7cq7N2GazqLAs/edit")
    # if fetcher
    @text = fetcher.FetchContent()
  end
end
