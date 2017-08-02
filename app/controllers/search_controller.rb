class SearchController < ApplicationController
  def index
    binding.pry
    @search = params[:query]
  end
end
