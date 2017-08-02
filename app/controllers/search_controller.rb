class SearchController < ApplicationController
  def index
    @search = params[:query]
  end
end
